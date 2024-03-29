DROP TABLE IF EXISTS ingredients CASCADE;

CREATE TABLE ingredients (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  date_published TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  date_modified TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  recipe_id UUID REFERENCES recipes(id) ON DELETE CASCADE NOT NULL,
  name TEXT NOT NULL,
  measurement TEXT NOT NULL,
  quantity TEXT NOT NULL,
  owner TEXT DEFAULT current_setting('request.jwt.claims', true)::json->>'email'
);

GRANT ALL ON "ingredients" TO "anon";

CREATE TRIGGER set_timestamptz
    BEFORE UPDATE ON ingredients
    FOR EACH ROW
    EXECUTE PROCEDURE set_timestamptz ();

ALTER TABLE ingredients ENABLE ROW LEVEL SECURITY;
ALTER TABLE ingredients FORCE ROW LEVEL SECURITY;

CREATE POLICY ingredients_policy_select
  ON ingredients
  FOR SELECT
  USING (true);

CREATE POLICY ingredients_policy_insert
  ON ingredients
  FOR INSERT
  WITH CHECK (owner = current_setting('request.jwt.claims', true)::json->>'email');

CREATE POLICY ingredients_policy_update
  ON ingredients
  FOR UPDATE
  USING (owner = current_setting('request.jwt.claims', true)::json->>'email');

CREATE POLICY ingredients_policy_delete
  ON ingredients
  FOR DELETE
  USING (owner = current_setting('request.jwt.claims', true)::json->>'email');
