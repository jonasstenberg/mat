import { cookies } from 'next/headers'
import { Recipe } from '../types/recipe'

export async function getRecipes(search: string): Promise<Recipe[]> {
  const headersList = cookies()
  const token = headersList.get('next-auth.session-token')

  const baseUrl = `${process.env.API_ENDPOINT}/recipes_and_categories`
  const baseQuery = '?order=name&select=*,categories(*)'
  const searchQuery = search?.length ? `&full_tsv=fts(swedish).${search}:*` : ''

  const url = `${baseUrl}${baseQuery}${searchQuery}`

  const recipeResult = await fetch(url, {
    next: { revalidate: 3600 }
  })
  const recipeData = await recipeResult.json()

  return recipeData
}

export async function getAllRecipeIds() {
  const recipeResult = await fetch('https://mat.stenberg.io/api/v1/recipes?select=id')
  const recipeData = await recipeResult.json()
  return recipeData
}

export async function getRecipe(id: string | undefined): Promise<Recipe> {
  const recipeResult = await fetch(`https://mat.stenberg.io/api/v1/recipes?id=eq.${id}&select=*,categories(*)`, {
    next: { revalidate: 3600 }
  })
  const recipeData = await recipeResult.json()
  return recipeData[0]
}

export async function postRecipe() {
  const headersList = cookies()
  const token = headersList.get('next-auth.session-token')

  const test: Recipe = {
    name: 'asdf',
    description: 'beskrivning',
    ingredients: ['ingredients']
  }

  const url = `${process.env.API_ENDPOINT}/recipes`

  const recipeResult = await fetch(url, {
    method: 'POST',
    headers: {
      Authorization: `Bearer ${token?.value}`,
      'Content-Type': 'application/json',
      Prefer: 'return=representation',
      Accept: 'application/vnd.pgrst.object+json'
    },
    body: JSON.stringify(test)
  })

  const recipeData = await recipeResult.json()
  return recipeData
}
