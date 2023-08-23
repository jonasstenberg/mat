'use server';

import { cookies } from 'next/headers';
import { revalidatePath } from 'next/cache';

import { config } from '@/utils/config';
import { IngredientSchema, InstructionSchema, RecipeSchema, recipeSchema } from '@/types/recipe';
import { extractError } from '@/utils/extractError';
import { validateSchema } from '@/utils/validateSchema';
import { deleteImage, uploadNewImage, resizeExistingImage } from './image';

export type RecipeResponse = {
  success?: { id?: string };
  errors?: { [key: string]: string };
};

const getAuthToken = cookies().get('next-auth.session-token')?.value;

const getAuthorizedHeaders = () => ({
  Authorization: `Bearer ${getAuthToken}`,
  'Content-Type': 'application/json',
  Prefer: 'return=representation',
});

const parseRecipeFormData = (formData: FormData): RecipeSchema => {
  const categories = JSON.parse(formData.get('categories') as string) as string[];
  const ingredients = JSON.parse(formData.get('ingredients') as string) as IngredientSchema[];
  const instructions = JSON.parse(formData.get('instructions') as string) as InstructionSchema[];

  return {
    name: formData.get('name') as string,
    recipe_yield: parseInt(formData.get('recipe_yield') as string, 10),
    recipe_yield_name: formData.get('recipe_yield_name') as string,
    prep_time: parseInt(formData.get('prep_time') as string, 10),
    cook_time: parseInt(formData.get('cook_time') as string, 10),
    categories,
    description: formData.get('description') as string,
    ingredients,
    instructions,
    image: formData.get('image') as string | Blob | null,
  };
};

const handleFetchError = async (response: globalThis.Response) => {
  let jsonData = null;

  try {
    jsonData = await response.json();
  } catch {
    /* empty */
  }

  if (!response.ok) {
    const errorDetail = jsonData ? `, ${JSON.stringify(jsonData)}` : '';
    throw new Error(`Response not ok ${response.status}${errorDetail}`);
  }

  return jsonData;
};

export async function updateRecipe(id: string, formData: FormData): Promise<RecipeResponse> {
  const recipe = parseRecipeFormData(formData);

  const { success, errors, data } = validateSchema<RecipeSchema>(recipeSchema, recipe);

  if (!success || !data) {
    return {
      errors,
    };
  }

  try {
    const file = data.image;
    let image;
    if (file) {
      if (typeof file === 'string') {
        image = await resizeExistingImage(file);
      } else {
        const oldFile = file && typeof file === 'string' ? file : undefined;
        image = await uploadNewImage(file as Blob, oldFile);
      }
    }

    const res = await fetch(`${config.apiEndpoint}/rpc/update_recipe`, {
      method: 'POST',
      headers: getAuthorizedHeaders(),
      body: JSON.stringify({
        r_recipe_id: id,
        ...data,
        ...(image && { image }),
      }),
    });

    await handleFetchError(res);

    revalidatePath('/');
    revalidatePath(`/recipe/${id}`);

    return {
      success: {},
    };
  } catch (error: unknown) {
    const message = extractError(error);
    console.error(message);
    return {
      errors: {
        global: 'Något gick fel, försök igen senare.',
      },
    };
  }
}

export async function saveRecipe(formData: FormData): Promise<RecipeResponse> {
  const recipe = parseRecipeFormData(formData);

  const { success, errors, data } = validateSchema<RecipeSchema>(recipeSchema, recipe);

  if (!success) {
    return {
      errors,
    };
  }

  try {
    let image;
    const file = formData.get('image') as Blob;

    if (file && file.size > 0) {
      image = await uploadNewImage(file);
    }

    const res = await fetch(`${config.apiEndpoint}/rpc/insert_recipe`, {
      method: 'POST',
      headers: getAuthorizedHeaders(),
      body: JSON.stringify({
        ...data,
        ...(image && { image }),
      }),
    });

    const id = await handleFetchError(res);

    return {
      success: {
        id,
      },
    };
  } catch (error: unknown) {
    const message = extractError(error);
    console.error(message);
    return {
      errors: {
        global: 'Något gick fel, försök igen senare.',
      },
    };
  }
}

export async function deleteRecipe(id: string) {
  try {
    const resRecipeDetails = await fetch(`${config.apiEndpoint}/recipes?id=eq.${id}`, {
      headers: {
        ...getAuthorizedHeaders(),
        Accept: 'application/vnd.pgrst.object + json',
      },
    });
    const recipeDetails = await handleFetchError(resRecipeDetails);

    if (recipeDetails && recipeDetails.image) {
      await deleteImage(recipeDetails.image);
    }

    const res = await fetch(`${config.apiEndpoint}/recipes?id=eq.${id}`, {
      method: 'DELETE',
      headers: getAuthorizedHeaders(),
    });

    await handleFetchError(res);
  } catch (error) {
    const message = extractError(error);
    console.error(message);
  }

  revalidatePath('/');
}
