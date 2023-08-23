DROP TABLE IF EXISTS instructions CASCADE;

CREATE TABLE instructions (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  date_publised TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  date_modified TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  recipe_id UUID REFERENCES recipes(id) ON DELETE CASCADE NOT NULL,
  step TEXT NOT NULL,
  owner TEXT DEFAULT current_setting('request.jwt.claims', true)::json->>'email'
);

GRANT ALL ON "instructions" TO "anon";

CREATE TRIGGER set_timestamptz
    BEFORE UPDATE ON instructions
    FOR EACH ROW
    EXECUTE PROCEDURE set_timestamptz ();

ALTER TABLE instructions ENABLE ROW LEVEL SECURITY;
ALTER TABLE instructions FORCE ROW LEVEL SECURITY;

CREATE POLICY instructions_policy_select
  ON instructions
  FOR SELECT
  USING (true);

CREATE POLICY instructions_policy_insert
  ON instructions
  FOR INSERT
  WITH CHECK (owner = current_setting('request.jwt.claims', true)::json->>'email');

CREATE POLICY instructions_policy_update
  ON instructions
  FOR UPDATE
  USING (owner = current_setting('request.jwt.claims', true)::json->>'email');

CREATE POLICY instructions_policy_delete
  ON instructions
  FOR DELETE
  USING (owner = current_setting('request.jwt.claims', true)::json->>'email');
