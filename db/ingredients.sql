DROP TABLE IF EXISTS ingredients CASCADE;

CREATE TABLE ingredients (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  date_added TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  date_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  recipe_id UUID REFERENCES recipes(id) ON DELETE CASCADE NOT NULL,
  name TEXT NOT NULL,
  measurement TEXT NOT NULL,
  quantity TEXT NOT NULL,
  owner TEXT DEFAULT current_user
);

GRANT SELECT ON "ingredients" TO "anon";
GRANT ALL ON "ingredients" TO "registered";

CREATE TRIGGER set_timestamptz
    BEFORE UPDATE ON ingredients
    FOR EACH ROW
    EXECUTE PROCEDURE set_timestamptz ();

ALTER TABLE ingredients ENABLE ROW LEVEL SECURITY;

CREATE POLICY ingredients_policy_select
  ON ingredients
  FOR SELECT
  USING (true);

CREATE POLICY ingredients_policy_insert
  ON ingredients
  FOR INSERT
  WITH CHECK (owner = current_user);

CREATE POLICY ingredients_policy_update
  ON ingredients
  FOR UPDATE
  USING (owner = current_user);

CREATE POLICY ingredients_policy_delete
  ON ingredients
  FOR DELETE
  USING (owner = current_user);
