ALTER TABLE recipes
ADD COLUMN cook_time INTEGER;

ALTER TABLE recipes
ADD COLUMN prep_time INTEGER;

DROP FUNCTION insert_recipe(text,integer,text,jsonb[],jsonb[],text,text);
DROP FUNCTION update_recipe(uuid,text,integer,text,jsonb[],jsonb[],text,text);

CREATE OR REPLACE FUNCTION insert_recipe(
  new_name TEXT,
  new_servings INTEGER,
  new_prep_time INTEGER,
  new_cook_time INTEGER,
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
  INSERT INTO recipes(name, servings, prep_time, cook_time, description, image, thumbnail)
  VALUES(new_name, new_servings, new_prep_time, new_cook_time, new_description, new_image, new_thumbnail)
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
  new_prep_time INTEGER,
  new_cook_time INTEGER,
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
    prep_time = new_prep_time,
    cook_time = new_cook_time,
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
