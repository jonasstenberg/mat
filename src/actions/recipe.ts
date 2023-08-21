'use server';

import { join } from 'path';
import { fileTypeFromBuffer } from 'file-type';
import { stat, mkdir, writeFile, unlink } from 'fs/promises';
import { cookies } from 'next/headers';
import { revalidatePath } from 'next/cache';
import sharp from 'sharp';

import { config } from '@/utils/config';
import { IngredientSchema, RecipeSchema, recipeSchema } from '@/types/recipe';
import { extractError } from '@/utils/extractError';

const baseUrl = process.env.NEXT_PUBLIC_BASE_URL;

const parseFormData = (formData: FormData): RecipeSchema => {
  const categories = JSON.parse(formData.get('categories') as string) as string[];
  const ingredients = JSON.parse(formData.get('ingredients') as string) as IngredientSchema[];

  return {
    name: formData.get('name') as string,
    servings: parseInt(formData.get('servings') as string, 10),
    servings_name: formData.get('servings_name') as string,
    prep_time: parseInt(formData.get('prep_time') as string, 10),
    cook_time: parseInt(formData.get('cook_time') as string, 10),
    categories,
    description: formData.get('description') as string,
    ingredients,
    image: formData.get('image') as string | Blob | null,
  };
};

const uploadImage = async (id: string, image: Blob): Promise<string> => {
  const formData = new FormData();
  formData.append('file', image);

  const uploadDir = join(process.cwd(), 'public', 'uploads');

  try {
    await stat(uploadDir);
  } catch (e: any) {
    if (e.code === 'ENOENT') {
      await mkdir(uploadDir, { recursive: true });
    } else {
      throw new Error("Couldn't create folder");
    }
  }
  const filename = `${id}.webp`;
  const outputPath = join(uploadDir, filename);

  const file = formData.get('file') as Blob | null;

  if (!file) {
    try {
      unlink(outputPath);
    } catch (e: unknown) {
      throw new Error("Couldn't remove old image");
    }
    return '';
  }

  if (file.size > 5 * 1024 * 1024) {
    throw new Error('File is too large');
  }

  const fileBuffer = await file.arrayBuffer();

  const type = await fileTypeFromBuffer(fileBuffer);

  if (!type || !type.mime.startsWith('image/')) {
    throw new Error('Invalid file content');
  }

  const buffer = await sharp(fileBuffer).resize(600).withMetadata().toBuffer();

  await writeFile(outputPath, buffer);

  return filename;
};

export async function saveRecipe(formData: FormData): Promise<string> {
  const token = cookies().get('next-auth.session-token')?.value;

  if (!token) {
    throw new Error('Unauthorized');
  }

  const recipe = parseFormData(formData);

  const result = recipeSchema.safeParse(recipe);
  if (!result.success) {
    console.error("Can't parse input");
    return '';
  }

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

  const file = formData.get('image') as Blob;
  if (file && file.size > 0) {
    const filename = await uploadImage(id, file);

    await fetch(`${baseUrl}/api/recipe`, {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        recipeId: id,
        recipeToUpdate: {
          ...recipe,
          image: filename,
        },
      }),
    });
  }

  return id;
}

export async function updateRecipe(id: string, formData: FormData) {
  const token = cookies().get('next-auth.session-token')?.value;

  try {
    if (!token) {
      throw new Error('Unauthorized');
    }

    const recipe = parseFormData(formData);

    const result = recipeSchema.safeParse(recipe);
    if (!result.success) {
      throw new Error('Kan inte läsa datan');
    }

    const file = recipe.image;
    let filename = typeof file === 'string' ? recipe.image : null;

    const isTypeFile = file && file instanceof Blob && file.size > 0;

    if (isTypeFile) {
      filename = await uploadImage(id, file);
    }

    const res = await fetch(`${config.apiEndpoint}/rpc/update_recipe`, {
      method: 'POST',
      headers: {
        Authorization: `Bearer ${token}`,
        'Content-Type': 'application/json',
        Prefer: 'return=representation',
      },
      body: JSON.stringify({
        r_recipe_id: id,
        ...recipe,
        ...(isTypeFile && { image: filename }),
      }),
    });

    if (!res.ok) {
      const json = await res.json();
      console.error(`Response not ok ${res.status}, ${JSON.stringify(json)}`);
      throw new Error(`Response not ok ${res.status}, ${JSON.stringify(json)}`);
    }

    revalidatePath('/');
    revalidatePath(`/recipe/${id}`);
  } catch (error: unknown) {
    const message = extractError(error);
    console.error(message);
  }
}

export async function deleteRecipe(id: string) {
  const token = cookies().get('next-auth.session-token')?.value;

  try {
    if (!token) {
      throw new Error('Unauthorized');
    }

    const res = await fetch(`${config.apiEndpoint}/recipes?id=eq.${id}`, {
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
  } catch (error) {
    const message = extractError(error);
    console.error(message);
  }

  revalidatePath('/');
}
