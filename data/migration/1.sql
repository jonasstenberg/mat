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
GRANT ALL ON "ingredients" TO "jonas@stenberg.io";

INSERT INTO ingredients (recipe_id, name, measurement, quantity)
SELECT
  r.id,
  i::text AS name,
  '' AS measurement,
  '' AS quantity
FROM recipes r,
LATERAL jsonb_array_elements_text(r.ingredients) AS i;

ALTER TABLE recipes DROP COLUMN ingredients CASCADE;

ALTER TABLE recipes
ADD COLUMN servings INT DEFAULT 4;

UPDATE recipes
SET servings = 4;

CREATE OR REPLACE VIEW recipes_and_categories
AS
SELECT
  recipes.*,
  COALESCE(rc.rc, '[]') AS categories,
  ing.ingredients,
  to_tsvector('pg_catalog.swedish',
              concat_ws(' ',
                        recipes.name,
                        recipes.description,
                        ing.names,
                        jsonb_path_query_array(rc.rc::jsonb, '$.name'::jsonpath)
                       )
             ) as full_tsv
FROM recipes
LEFT JOIN LATERAL (
  SELECT jsonb_agg(rc) AS rc FROM (
    SELECT categories.* FROM categories, recipe_categories WHERE recipe_categories.category = categories.id AND recipe_categories.recipe = recipes.id
  ) AS rc
) AS rc ON TRUE
LEFT JOIN LATERAL (
  SELECT
    jsonb_agg(ingredient.*) AS ingredients,
    string_agg(ingredient.name, ' ') AS names
  FROM (
    SELECT ingredients.* FROM ingredients WHERE ingredients.recipe_id = recipes.id
  ) AS ingredient
) AS ing ON TRUE;

GRANT SELECT ON "recipes_and_categories" TO "anon";

CREATE OR REPLACE FUNCTION insert_recipe(
  new_name TEXT,
  new_servings INTEGER,
  new_description TEXT,
  new_categories jsonb[],
  new_ingredients jsonb[],
  new_image TEXT DEFAULT NULL,
  new_thumbnail TEXT DEFAULT NULL
)
RETURNS UUID LANGUAGE plpgsql AS $$
DECLARE
  new_recipe_id UUID;
  category jsonb;
  category_id UUID;
  ingredient jsonb;
BEGIN
  -- Insert into the recipes table
  INSERT INTO recipes(name, servings, description, image, thumbnail)
  VALUES(new_name, new_servings, new_description, new_image, new_thumbnail)
  RETURNING id INTO new_recipe_id;

  -- Handle categories
  FOREACH category IN ARRAY new_categories
  LOOP
    SELECT id INTO category_id FROM categories WHERE name = category->>'name';
    IF category_id IS NULL THEN
      INSERT INTO categories(name) VALUES(category->>'name') RETURNING id INTO category_id;
    END IF;
    INSERT INTO recipe_categories(recipe, category) VALUES(new_recipe_id, category_id);
  END LOOP;

  -- Handle ingredients
  FOREACH ingredient IN ARRAY new_ingredients
  LOOP
    INSERT INTO ingredients(recipe_id, name, measurement, quantity)
    VALUES(new_recipe_id, ingredient->>'name', ingredient->>'measurement', ingredient->>'quantity');
  END LOOP;

  RETURN new_recipe_id; -- Return the new recipe's ID
END;
$$;

GRANT EXECUTE ON FUNCTION insert_recipe TO "jonas@stenberg.io";

CREATE OR REPLACE FUNCTION update_recipe(
  r_recipe_id UUID,
  new_name TEXT,
  new_servings INTEGER,
  new_description TEXT,
  new_categories jsonb[],
  new_ingredients jsonb[],
  new_image TEXT DEFAULT NULL,
  new_thumbnail TEXT DEFAULT NULL
)
RETURNS void LANGUAGE plpgsql AS $$
DECLARE
  category jsonb;
  category_id UUID;
  ingredient jsonb;
BEGIN
  -- Update the recipes table
  UPDATE recipes SET
    name = new_name,
    servings = new_servings,
    description = new_description,
    image = new_image,
    thumbnail = new_thumbnail
  WHERE id = r_recipe_id;

  -- Update recipe categories
  DELETE FROM recipe_categories WHERE recipe = r_recipe_id;

  FOREACH category IN ARRAY new_categories
  LOOP
    SELECT id INTO category_id FROM categories WHERE name = category->>'name';
    IF category_id IS NULL THEN
      INSERT INTO categories(name) VALUES(category->>'name') RETURNING id INTO category_id;
    END IF;
    INSERT INTO recipe_categories(recipe, category) VALUES(r_recipe_id, category_id);
  END LOOP;

  -- Update ingredients
  DELETE FROM ingredients WHERE recipe_id = r_recipe_id;

  FOREACH ingredient IN ARRAY new_ingredients
  LOOP
    INSERT INTO ingredients(recipe_id, name, measurement, quantity)
    VALUES(r_recipe_id, ingredient->>'name', ingredient->>'measurement', ingredient->>'quantity');
  END LOOP;

END;
$$;

GRANT EXECUTE ON FUNCTION update_recipe TO "jonas@stenberg.io";

CREATE SCHEMA IF NOT EXISTS auth;

DROP TABLE IF EXISTS auth.users CASCADE;

CREATE TABLE auth.users (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL,
  email TEXT UNIQUE NOT NULL,
  pass TEXT NOT NULL,
  role NAME NOT NULL CHECK (LENGTH(role) < 512)
);

CREATE OR REPLACE FUNCTION
auth.check_role_exists() RETURNS TRIGGER AS $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_roles AS r WHERE r.rolname = NEW.role) THEN
    RAISE foreign_key_violation USING message =
      'unknown database role: ' || NEW.role;
    RETURN NULL;
  END IF;
  RETURN NEW;
END
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS ensure_user_role_exists ON auth.users;
CREATE CONSTRAINT TRIGGER ensure_user_role_exists
  AFTER INSERT OR UPDATE ON auth.users
  FOR EACH ROW
  EXECUTE PROCEDURE auth.check_role_exists();

CREATE OR REPLACE FUNCTION
auth.encrypt_pass() RETURNS TRIGGER AS $$
BEGIN
  IF tg_op = 'INSERT' OR NEW.pass <> OLD.pass THEN
    NEW.pass = crypt(NEW.pass, gen_salt('bf'));
  END IF;
  RETURN NEW;
END
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS encrypt_pass ON auth.users;
CREATE TRIGGER encrypt_pass
  BEFORE INSERT OR UPDATE ON auth.users
  FOR EACH ROW
  EXECUTE PROCEDURE auth.encrypt_pass();

CREATE OR REPLACE FUNCTION
auth.user_role(email TEXT, pass TEXT) RETURNS NAME
  LANGUAGE plpgsql
  AS $$
BEGIN
  RETURN (
  SELECT role FROM auth.users
   WHERE users.email = user_role.email
     AND users.pass = crypt(user_role.pass, users.pass)
  );
END;
$$;

-- login should be on your exposed schema
CREATE OR REPLACE FUNCTION
login(login_email TEXT, login_pass TEXT) RETURNS auth.users AS $$
DECLARE
  _role NAME;
  result auth.users;
BEGIN
  SELECT auth.user_role(login_email, login_pass) INTO _role;

  IF _role IS NULL THEN
    RAISE EXCEPTION 'invalid user or password';
  END IF;

  SELECT * INTO result FROM auth.users WHERE email = login_email;

  RETURN result;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

GRANT EXECUTE ON FUNCTION login(TEXT,TEXT) TO anon;
