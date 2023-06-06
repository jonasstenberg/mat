import { getToken } from 'next-auth/jwt'
import { NextRequest, NextResponse } from 'next/server'

const baseUrl = `${process.env.API_ENDPOINT}/recipes_and_categories`

export async function GET(req: NextRequest) {
  const token = await getToken({ req, raw: true })
  const { searchParams } = new URL(req.url)
  const search = searchParams.get('search')

  const baseQuery = '?order=name&select=*,categories(*)'
  const searchQuery = search?.length && `&full_tsv=fts(swedish).${search}:*`

  const url = `${baseUrl}${baseQuery}${searchQuery}`

  const recipeResult = await fetch(url)
  const recipeData = await recipeResult.json()

  return NextResponse.json(recipeData)
}

export async function POST(req: NextRequest) {
  const token = await getToken({ req, raw: true })
  const { searchParams } = new URL(req.url)
  const search = searchParams.get('search')

  const recipeResult = await fetch(baseUrl, {
    method: 'POST',
    headers: {
      Authorization: `Bearer ${token}`
    }
  })
  const recipeData = await recipeResult.json()

  return NextResponse.json(recipeData)
}
