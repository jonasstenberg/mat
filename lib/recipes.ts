import { RecipeProps } from '../types/recipe';

import { config } from '@/utils/config';

export async function getRecipes(search: string): Promise<RecipeProps[]> {
  const baseUrl = `${config.apiEndpoint}/recipes_and_categories`;
  const baseQuery = '?order=name&select=*,categories(*)';
  const searchQuery = search?.length ? `&full_tsv=fts(swedish).${search}:*` : '';

  const url = `${baseUrl}${baseQuery}${searchQuery}`;

  const recipeResult = await fetch(url, {
    next: { revalidate: 3600 },
  });
  const recipeData = await recipeResult.json();

  return recipeData;
}

export async function getAllRecipeIds() {
  const baseUrl = `${config.apiEndpoint}/recipes`;
  const recipeResult = await fetch(`${baseUrl}?select=id`);
  const recipeData = await recipeResult.json();
  return recipeData;
}

export async function getRecipe(id: string | undefined): Promise<RecipeProps> {
  const baseUrl = `${config.apiEndpoint}/recipes_and_categories`;

  const recipeResult = await fetch(`${baseUrl}?id=eq.${id}&select=*,categories(*)`, {
    next: { revalidate: 0 },
  });
  const recipeData = await recipeResult.json();
  return recipeData[0];
}
