import { NextRequest, NextResponse } from 'next/server';
import { getToken } from 'next-auth/jwt';

import { config } from '@/utils/config';
import { RecipeProps } from '@/types/recipe';

export async function POST(req: NextRequest) {
  const token = await getToken({ req, raw: true });

  if (!token) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { recipe: untypedRecipe } = await req.json();
  const recipe: RecipeProps = untypedRecipe;

  try {
    const res = await fetch(`${config.apiEndpoint}/rpc/insert_recipe`, {
      method: 'POST',
      headers: {
        Authorization: `Bearer ${token}`,
        'Content-Type': 'application/json',
        Prefer: 'return=representation',
      },
      body: JSON.stringify(recipe),
    });

    const id = await res.json();

    if (!res.ok) {
      throw new Error(`Response not ok ${res.status}, ${JSON.stringify(id)}`);
    }

    return NextResponse.json(id);
  } catch (err) {
    console.error(err);
    return NextResponse.json({ error: 'Something went wrong.' }, { status: 500 });
  }
}

export async function PUT(req: NextRequest) {
  const token = await getToken({ req, raw: true });

  if (!token) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { recipeId, recipeToUpdate } = await req.json();

  const recipe: RecipeProps = recipeToUpdate;

  try {
    const res = await fetch(`${config.apiEndpoint}/rpc/update_recipe`, {
      method: 'POST',
      headers: {
        Authorization: `Bearer ${token}`,
        'Content-Type': 'application/json',
        Prefer: 'return=representation',
      },
      body: JSON.stringify({
        r_recipe_id: recipeId,
        ...recipe,
      }),
    });

    if (!res.ok) {
      const json = await res.json();
      throw new Error(`Response not ok ${res.status}, ${JSON.stringify(json)}`);
    }
  } catch (err) {
    console.error(err);
    return NextResponse.json({ error: 'Something went wrong.' }, { status: 500 });
  }

  return NextResponse.json({}, { status: 200 });
}

export async function DELETE(req: NextRequest) {
  const token = await getToken({ req, raw: true });

  if (!token) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { searchParams } = new URL(req.url);
  const recipeId = searchParams.get('id');

  try {
    const res = await fetch(`${config.apiEndpoint}/recipes?id=eq.${recipeId}`, {
      method: 'DELETE',
      headers: {
        Authorization: `Bearer ${token}`,
        'Content-Type': 'application/json',
      },
    });

    if (!res.ok) {
      const json = await res.json();
      throw new Error(`Response not ok ${res.status}, ${JSON.stringify(json)}`);
    }
  } catch (err) {
    console.error(err);
    return NextResponse.json({ error: 'Something went wrong.' }, { status: 500 });
  }

  return NextResponse.json({}, { status: 200 });
}
