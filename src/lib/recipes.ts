import { RecipeSchema } from '@/types/recipe';
import { config } from '@/utils/config';

export async function getRecipes({
  owner,
  search,
  filteredCategoryParam,
}: {
  owner: string | null | undefined;
  search: string;
  filteredCategoryParam: string;
}): Promise<RecipeSchema[]> {
  const baseUrl = `${config.apiEndpoint}/recipes_and_categories`;
  const baseQuery = '?order=name';
  const ownerQuery = owner ? `&owner=eq.${owner}` : '';
  const searchQuery = search?.length
    ? `&full_tsv=fts(swedish).${encodeURIComponent(search)}:*`
    : '';
  const categoryQuery = filteredCategoryParam?.length
    ? `&categories=cs.{${encodeURIComponent(filteredCategoryParam)}}`
    : '';

  const url = `${baseUrl}${baseQuery}${ownerQuery}${searchQuery}${categoryQuery}`;

  const recipeResult = await fetch(url, { cache: 'no-store' });
  const recipeData = await recipeResult.json();

  return recipeData;
}

export async function getAllRecipeIds() {
  const baseUrl = `${config.apiEndpoint}/recipes`;
  const recipeResult = await fetch(`${baseUrl}?select=id`);
  const recipeData = await recipeResult.json();
  return recipeData;
}

export async function getRecipe(id: string | undefined): Promise<RecipeSchema> {
  const baseUrl = `${config.apiEndpoint}/recipes_and_categories`;

  const recipeResult = await fetch(`${baseUrl}?id=eq.${id}`, {
    next: { revalidate: 0 },
  });
  const recipeData = await recipeResult.json();
  return recipeData[0];
}
