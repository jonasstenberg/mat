DROP TABLE IF EXISTS categories CASCADE;

CREATE TABLE categories (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  date_published TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  date_modified TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  name TEXT UNIQUE NOT NULL,
  owner TEXT DEFAULT current_setting('request.jwt.claims', true)::json->>'email'
);

GRANT ALL ON "categories" TO "anon";

CREATE TRIGGER set_timestamptz
    BEFORE UPDATE ON categories
    FOR EACH ROW
    EXECUTE PROCEDURE set_timestamptz ();

ALTER TABLE categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE categories FORCE ROW LEVEL SECURITY;

CREATE POLICY categories_policy_select
  ON categories
  FOR SELECT
  USING (true);

CREATE POLICY categories_policy_insert
  ON categories
  FOR INSERT
  WITH CHECK (owner = current_setting('request.jwt.claims', true)::json->>'email');

CREATE POLICY categories_policy_update
  ON categories
  FOR UPDATE
  USING (owner = current_setting('request.jwt.claims', true)::json->>'email');

CREATE POLICY categories_policy_delete
  ON categories
  FOR DELETE
  USING (owner = current_setting('request.jwt.claims', true)::json->>'email');
