DROP TABLE IF EXISTS recipe_categories CASCADE;

CREATE TABLE recipe_categories (
  date_added TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  recipe UUID REFERENCES recipes(id) ON DELETE CASCADE NOT NULL,
  category UUID REFERENCES categories(id) ON DELETE CASCADE NOT NULL,
  PRIMARY KEY (recipe, category),
  owner TEXT DEFAULT current_setting('request.jwt.claims', true)::json->>'email'
);

GRANT ALL ON "recipe_categories" TO "anon";

ALTER TABLE recipe_categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE recipe_categories FORCE ROW LEVEL SECURITY;

CREATE POLICY recipe_categories_policy_select
  ON recipe_categories
  FOR SELECT
  USING (true);

CREATE POLICY recipe_categories_policy_insert
  ON recipe_categories
  FOR INSERT
  WITH CHECK (owner = current_setting('request.jwt.claims', true)::json->>'email');

CREATE POLICY recipe_categories_policy_update
  ON recipe_categories
  FOR UPDATE
  USING (owner = current_setting('request.jwt.claims', true)::json->>'email');

CREATE POLICY recipe_categories_policy_delete
  ON recipe_categories
  FOR DELETE
  USING (owner = current_setting('request.jwt.claims', true)::json->>'email');
