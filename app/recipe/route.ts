import { getToken } from 'next-auth/jwt'
import { NextRequest, NextResponse } from 'next/server'

const baseUrl = `${process.env.API_ENDPOINT}/recipes`

export async function GET(req: NextRequest) {
  const token = await getToken({ req, raw: true })
  const { searchParams } = new URL(req.url)
  const search = searchParams.get('search')

  const append = search?.length ? `?tsv=fts(swedish).${search}:*` : '?order=name&select*,categories(*)'
  const recipeResult = await fetch(`${baseUrl}${append}`)
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
