SET client_min_messages = 'ERROR';

CREATE DATABASE mat WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';
ALTER DATABASE mat OWNER TO jonasstenberg;

DROP TABLE IF EXISTS recipes CASCADE;
DROP TABLE IF EXISTS categories CASCADE;
DROP TABLE IF EXISTS recipe_categories CASCADE;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
create extension if not exists "pgcrypto";

DROP ROLE IF EXISTS "anon";
DROP ROLE IF EXISTS "jonas@stenberg.io";

CREATE ROLE authenticator LOGIN NOINHERIT NOCREATEDB NOCREATEROLE NOSUPERUSER;
CREATE ROLE "anon";
CREATE ROLE "jonas@stenberg.io" INHERIT;

GRANT "anon" TO "jonasstenberg";
GRANT "jonas@stenberg.io" TO "jonasstenberg";

CREATE OR REPLACE FUNCTION set_timestamp() RETURNS TRIGGER AS
$$
  BEGIN
    NEW.date_updated = CURRENT_TIMESTAMP;
    RETURN NEW;
  END;
$$
LANGUAGE plpgsql;

-- Recipes
CREATE TABLE recipes (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  date_added TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  date_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  name TEXT NOT NULL,
  ingredients JSONB NOT NULL,
  description TEXT NOT NULL,
  image TEXT,
  thumbnail TEXT,
  owner TEXT DEFAULT current_user,
  tsv tsvector
);

GRANT SELECT ON "recipes" TO "anon";
GRANT ALL ON "recipes" TO "jonas@stenberg.io";

CREATE TRIGGER set_timestamp
  BEFORE UPDATE ON recipes
  FOR EACH ROW
  EXECUTE PROCEDURE set_timestamp();

-- Categories
CREATE TABLE categories (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  date_added TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  date_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  name TEXT UNIQUE NOT NULL,
  owner TEXT DEFAULT current_user
);

GRANT SELECT ON "categories" TO "anon";
GRANT ALL ON "categories" TO "jonas@stenberg.io";

CREATE TRIGGER set_timestamp
  BEFORE UPDATE ON categories
  FOR EACH ROW
  EXECUTE PROCEDURE set_timestamp();

-- Recipe categories
CREATE TABLE recipe_categories (
  date_added TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  recipe UUID REFERENCES recipes(id) ON DELETE CASCADE NOT NULL,
  category UUID REFERENCES categories(id) ON DELETE CASCADE NOT NULL,
  PRIMARY KEY (recipe, category),
  owner TEXT DEFAULT current_user
);

GRANT SELECT ON "recipe_categories" TO "anon";
GRANT ALL ON "recipe_categories" TO "jonas@stenberg.io";

-- FTS
CREATE OR REPLACE FUNCTION documents_search_trigger() RETURNS trigger AS $$
begin
  new.tsv :=
    to_tsvector('pg_catalog.swedish', coalesce(new.name,'')) ||
    to_tsvector('pg_catalog.swedish', coalesce(new.description,''));
  return new;
end
$$ LANGUAGE plpgsql;

CREATE TRIGGER tsvectorupdate BEFORE INSERT OR UPDATE
ON recipes FOR EACH ROW EXECUTE PROCEDURE documents_search_trigger();

CREATE INDEX tsv_idx ON recipes USING gin(tsv);

CREATE VIEW recipes_and_categories
AS
SELECT recipes.*, COALESCE(rc.rc, '[]') AS categories, to_tsvector('pg_catalog.swedish', concat_ws(' ', recipes.name, recipes.ingredients, recipes.description, jsonb_path_query_array(rc.rc::jsonb, '$.name'::jsonpath))) as full_tsv
FROM recipes
LEFT JOIN LATERAL (
  SELECT jsonb_agg(rc) AS rc FROM (
    SELECT categories.* FROM categories, recipe_categories WHERE recipe_categories.category = categories.id AND recipe_categories.recipe = recipes.id
  ) AS rc
) AS rc ON TRUE;

GRANT SELECT ON "recipes_and_categories" TO "anon";
