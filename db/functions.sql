CREATE OR REPLACE FUNCTION insert_recipe(
  name TEXT,
  servings INTEGER,
  servings_name TEXT,
  prep_time INTEGER,
  cook_time INTEGER,
  description TEXT,
  categories TEXT[],
  ingredients JSONB[],
  image TEXT DEFAULT NULL,
  thumbnail TEXT DEFAULT NULL
)
RETURNS UUID LANGUAGE plpgsql AS $$
DECLARE
  new_recipe_id UUID;
  category TEXT;
  category_id UUID;
  ingredient JSONB;
BEGIN
  -- Insert into the recipes table
  INSERT INTO recipes(name, servings, servings_name, prep_time, cook_time, description, image, thumbnail)
  VALUES(name, servings, servings_name, prep_time, cook_time, description, image, thumbnail)
  RETURNING id INTO new_recipe_id;

  -- Handle categories
  FOREACH category IN ARRAY categories
  LOOP
    SELECT id INTO category_id FROM public.categories WHERE public.categories.name = category;
    IF category_id IS NULL THEN
      INSERT INTO public.categories(name) VALUES(category) RETURNING id INTO category_id;
    END IF;
    INSERT INTO recipe_categories(recipe, category) VALUES(new_recipe_id, category_id);
  END LOOP;

  -- Handle ingredients
  FOREACH ingredient IN ARRAY ingredients
  LOOP
    INSERT INTO public.ingredients(recipe_id, name, measurement, quantity)
    VALUES(new_recipe_id, ingredient->>'name', ingredient->>'measurement', ingredient->>'quantity');
  END LOOP;

  RETURN new_recipe_id; -- Return the new recipe's ID
END;
$$;

GRANT EXECUTE ON FUNCTION insert_recipe TO "anon";

CREATE OR REPLACE FUNCTION update_recipe(
  r_recipe_id UUID,
  name TEXT,
  servings INTEGER,
  servings_name TEXT,
  prep_time INTEGER,
  cook_time INTEGER,
  description TEXT,
  categories TEXT[],
  ingredients JSONB[],
  image TEXT DEFAULT NULL,
  thumbnail TEXT DEFAULT NULL
)
RETURNS void LANGUAGE plpgsql AS $$
DECLARE
  category TEXT;
  category_id UUID;
  ingredient JSONB;
BEGIN
  -- Update the recipes table
  UPDATE recipes SET
    name = update_recipe.name,
    servings = update_recipe.servings,
    servings_name = update_recipe.servings_name,
    prep_time = update_recipe.prep_time,
    cook_time = update_recipe.cook_time,
    description = update_recipe.description,
    image = update_recipe.image,
    thumbnail = update_recipe.thumbnail
  WHERE id = r_recipe_id;

  DELETE FROM recipe_categories WHERE recipe = r_recipe_id;

  FOREACH category IN ARRAY update_recipe.categories
  LOOP
    SELECT id INTO category_id FROM categories WHERE categories.name = category;
    IF category_id IS NULL THEN
      INSERT INTO categories(name) VALUES(category) RETURNING id INTO category_id;
    END IF;
    INSERT INTO recipe_categories(recipe, category) VALUES(r_recipe_id, category_id);
  END LOOP;

  DELETE FROM ingredients WHERE recipe_id = r_recipe_id;

  FOREACH ingredient IN ARRAY update_recipe.ingredients
  LOOP
    INSERT INTO ingredients(recipe_id, name, measurement, quantity)
    VALUES(r_recipe_id, ingredient->>'name', ingredient->>'measurement', ingredient->>'quantity');
  END LOOP;

END;
$$;

GRANT EXECUTE ON FUNCTION update_recipe TO "anon";
