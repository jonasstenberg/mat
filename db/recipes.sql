DROP TABLE IF EXISTS recipes CASCADE;

CREATE TABLE recipes (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  date_published TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  date_modified TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  name TEXT NOT NULL,
  author TEXT NOT NULL,
  recipe_yield INTEGER DEFAULT 4,
  recipe_yield_name TEXT DEFAULT 'portioner' NOT NULL,
  prep_time INTEGER DEFAULT 0 NOT NULL,
  cook_time INTEGER DEFAULT 0 NOT NULL,
  cuisine TEXT,
  description TEXT NOT NULL,
  image TEXT,
  thumbnail TEXT,
  owner TEXT REFERENCES users (email) ON DELETE CASCADE DEFAULT current_setting('request.jwt.claims', true)::json->>'email' NOT NULL,
  tsv tsvector
);

GRANT ALL ON "recipes" TO "anon";

CREATE TRIGGER set_timestamptz
    BEFORE UPDATE ON recipes
    FOR EACH ROW
    EXECUTE PROCEDURE set_timestamptz ();

ALTER TABLE recipes ENABLE ROW LEVEL SECURITY;
ALTER TABLE recipes FORCE ROW LEVEL SECURITY;

CREATE POLICY recipes_policy_select
  ON recipes
  FOR SELECT
  USING (true);

CREATE POLICY recipes_policy_insert
  ON recipes
  FOR INSERT
  WITH CHECK (owner = current_setting('request.jwt.claims')::json->>'email');

CREATE POLICY recipes_policy_update
  ON recipes
  FOR UPDATE
  USING (owner = current_setting('request.jwt.claims')::json->>'email');

CREATE POLICY recipes_policy_delete
  ON recipes
  FOR DELETE
  USING (owner = current_setting('request.jwt.claims')::json->>'email');
