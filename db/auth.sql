DROP TABLE IF EXISTS users CASCADE;

CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL,
  measures_system TEXT DEFAULT 'metric',
  email TEXT UNIQUE NOT NULL,
  provider TEXT,
  owner TEXT DEFAULT current_setting('request.jwt.claims', true)::json->>'email'
);

GRANT SELECT, UPDATE, INSERT, DELETE ON users TO "anon";

ALTER TABLE users ENABLE ROW LEVEL SECURITY;
ALTER TABLE users FORCE ROW LEVEL SECURITY;

CREATE POLICY users_policy_select
  ON users
  FOR SELECT
  USING (owner = current_setting('request.jwt.claims', true)::json->>'email');

CREATE POLICY users_policy_insert
  ON users
  FOR INSERT
  WITH CHECK (owner = current_setting('request.jwt.claims', true)::json->>'email');

CREATE POLICY users_policy_update
  ON users
  FOR UPDATE
  USING (owner = current_setting('request.jwt.claims', true)::json->>'email');

CREATE POLICY users_policy_delete
  ON users
  FOR DELETE
  USING (owner = current_setting('request.jwt.claims', true)::json->>'email');

DROP TABLE IF EXISTS user_passwords CASCADE;

CREATE TABLE IF NOT EXISTS user_passwords (
  email text PRIMARY KEY REFERENCES users (email) ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT NULL,
  password text NOT NULL,
  owner TEXT DEFAULT current_setting('request.jwt.claims', true)::json->>'email'
);

CREATE OR REPLACE FUNCTION
encrypt_password() RETURNS TRIGGER AS $$
BEGIN
  IF tg_op = 'INSERT' OR NEW.password <> OLD.password THEN
    NEW.password = crypt(NEW.password, gen_salt('bf'));
  END IF;
  RETURN NEW;
END
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS encrypt_password ON user_passwords;

CREATE TRIGGER encrypt_password
  BEFORE INSERT OR UPDATE ON user_passwords
  FOR EACH ROW
  EXECUTE PROCEDURE encrypt_password();

CREATE OR REPLACE FUNCTION
login(login_email TEXT, login_password TEXT) RETURNS users AS $$
DECLARE
  _role NAME;
  result users;
BEGIN
  SELECT
      user_passwords.email
  FROM
      users
      INNER JOIN user_passwords ON users.email = user_passwords.email
  WHERE
      users.email = login_email
      AND user_passwords.password = crypt(login_password, user_passwords.password)
  INTO _role;

  IF _role IS NULL THEN
    RAISE EXCEPTION 'invalid user or password';
  END IF;

  SELECT * INTO result FROM users WHERE email = login_email;

  RETURN result;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

GRANT EXECUTE ON FUNCTION login(TEXT,TEXT) TO anon;

CREATE OR REPLACE FUNCTION signup (name text, email text, password text default null, provider text default null)
    RETURNS jsonb
    AS $$
DECLARE
  _role NAME;
  _user_id uuid;
  _json_result jsonb;
BEGIN
    SELECT u.id
    INTO _user_id
    FROM users u
    WHERE u.email = signup.email;

    IF _user_id IS NOT NULL THEN
      RAISE EXCEPTION 'already-exists';
    ELSE
      INSERT INTO users (name, email, provider, owner) VALUES (name, email, provider, email)
      RETURNING id INTO _user_id;

      IF provider IS NULL THEN
        INSERT INTO user_passwords (email, password) VALUES (email, password);
      END IF;
    END IF;

    _json_result := jsonb_build_object('id', _user_id);

    RETURN _json_result;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

GRANT EXECUTE ON FUNCTION signup(TEXT, TEXT, TEXT, TEXT) TO "anon";

CREATE OR REPLACE FUNCTION signup_provider(name text, email text, provider text default null)
    RETURNS jsonb
    AS $$
DECLARE
  _json_result jsonb;
BEGIN
  SELECT INTO _json_result signup(name, email, NULL, provider);
  RETURN _json_result;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

GRANT EXECUTE ON FUNCTION signup_provider(TEXT, TEXT, TEXT) TO "anon";

CREATE OR REPLACE FUNCTION reset_password(email text, old_password text, new_password text)
    RETURNS void
    AS $$
DECLARE
    stored_password text;
BEGIN
    SELECT password INTO stored_password FROM user_passwords WHERE user_passwords.email = reset_password.email;

    IF stored_password IS NULL THEN
        RAISE EXCEPTION 'no-email-found';
    END IF;

    IF stored_password <> crypt(old_password, stored_password) THEN
        RAISE EXCEPTION 'incorrect-old-password';
    END IF;

    IF LENGTH(reset_password.new_password) < 8 OR
       NOT (reset_password.new_password ~* '.*[A-Z].*') OR
       NOT (reset_password.new_password ~* '.*[a-z].*') OR
       NOT (reset_password.new_password ~ '\d') THEN
        RAISE EXCEPTION 'not-meet-requirements';
    END IF;

    UPDATE
        user_passwords
    SET
        password = reset_password.new_password
    WHERE
        user_passwords.email = reset_password.email;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

GRANT EXECUTE ON FUNCTION reset_password TO "anon";
