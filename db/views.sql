CREATE OR REPLACE VIEW recipes_and_categories
AS
SELECT
  recipes.*,
  COALESCE(rc.categories, '[]') AS categories,
  ing.ingredients,
  to_tsvector('pg_catalog.swedish',
              concat_ws(' ',
                        recipes.name,
                        recipes.description,
                        ing.names,
                        jsonb_path_query_array(rc.categories::jsonb, '$'::jsonpath)
                       )
             ) as full_tsv
FROM recipes
LEFT JOIN LATERAL (
  SELECT jsonb_agg(name) AS categories FROM (
    SELECT categories.name FROM categories, recipe_categories WHERE recipe_categories.category = categories.id AND recipe_categories.recipe = recipes.id
  ) AS rc_categories
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
