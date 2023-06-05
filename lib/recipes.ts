import { cookies } from 'next/headers'
import { Recipe } from '../types/recipe'

export async function getRecipes(search: string): Promise<Recipe[]> {
  const headersList = cookies()
  const token = headersList.get('next-auth.session-token')
  const recipeResult = await fetch(`${process.env.BASE_URL}/recipe?search=${search}`, {
    headers: { Authorization: `Bearer ${token?.value}` },
    next: { revalidate: 3600 }
  })
  const recipeData = await recipeResult.json()
  return recipeData
}

export async function getAllRecipeIds() {
  const recipeResult = await fetch('https://mat.old.stenberg.io/api/recipes?select=id')
  const recipeData = await recipeResult.json()
  return recipeData
}

export async function getRecipe(id: string | undefined): Promise<Recipe> {
  const recipeResult = await fetch(`https://mat.old.stenberg.io/api/recipes?id=eq.${id}&select=*,categories(*)`, {
    next: { revalidate: 3600 }
  })
  const recipeData = await recipeResult.json()
  return recipeData[0]
}
