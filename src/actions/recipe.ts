'use server';

import { cookies } from 'next/headers';
import { revalidatePath } from 'next/cache';
import OpenAI from 'openai';

import { config } from '@/utils/config';
import { IngredientSchema, InstructionSchema, RecipeSchema, recipeSchema } from '@/types/recipe';
import { extractError } from '@/utils/extractError';
import { validateSchema } from '@/utils/validateSchema';
import { deleteImage, uploadNewImage, resizeExistingImage, uploadNewImageFromUrl } from './image';
import { UNKNOWN_ERROR } from '@/utils/errors';
import { Result, ResultVoid } from '@/utils/result';
import { getCategories } from '@/lib/categories';

const openai = new OpenAI({
  organization: 'org-tblg3uwWsfbw943UpETW9AIp',
});

const getAuthorizedHeaders = () => {
  const getAuthToken = cookies().get(`${config.cookieSecurePrefix}next-auth.session-token`)?.value;

  return {
    Authorization: `Bearer ${getAuthToken}`,
    'Content-Type': 'application/json',
    Prefer: 'return=representation',
  };
};

const parseRecipeFormData = (formData: FormData): RecipeSchema => {
  const categories = JSON.parse(formData.get('categories') as string) as string[];
  const ingredients = JSON.parse(formData.get('ingredients') as string) as IngredientSchema[];
  const instructions = JSON.parse(formData.get('instructions') as string) as InstructionSchema[];
  const author = (formData.get('author') as string) ?? '';
  const url = (formData.get('url') as string) ?? '';

  return {
    name: formData.get('name') as string,
    author,
    url,
    recipe_yield: parseInt(formData.get('recipe_yield') as string, 10),
    recipe_yield_name: formData.get('recipe_yield_name') as string,
    prep_time: parseInt(formData.get('prep_time') as string, 10),
    cook_time: parseInt(formData.get('cook_time') as string, 10),
    categories,
    description: formData.get('description') as string,
    ingredients,
    instructions,
    image: formData.get('image') as string | Blob | undefined,
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

export async function updateRecipe(id: string, formData: FormData): Promise<ResultVoid> {
  const recipe = parseRecipeFormData(formData);

  const { success, errors, data } = validateSchema<RecipeSchema>(recipeSchema, recipe);

  if (!success || !data) {
    return {
      success: false,
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
      success: true,
    };
  } catch (error: unknown) {
    const message = extractError(error);
    console.error(message);
    return {
      success: false,
      errors: {
        global: UNKNOWN_ERROR.message,
      },
    };
  }
}

export async function saveRecipe(formData: FormData): Promise<Result<string>> {
  const recipe = parseRecipeFormData(formData);

  const { success, errors, data } = validateSchema<RecipeSchema>(recipeSchema, recipe);

  if (!success) {
    return {
      success: false,
      errors,
    };
  }

  try {
    let image;
    const file = formData.get('image') as Blob;

    if (file && file.size > 0) {
      image = await uploadNewImage(file);
    } else if (typeof file === 'string' && /^https?:\/\//.test(file)) {
      image = await uploadNewImageFromUrl(file);
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
      success: true,
      value: id,
    };
  } catch (error: unknown) {
    const message = extractError(error);
    console.error(message);
    return {
      success: false,
      errors: {
        global: UNKNOWN_ERROR.message,
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

export const getRecipeUsingOpenaiVision = async (
  image: string,
  mimeType: string
): Promise<RecipeSchema | null> => {
  const categories = await getCategories();

  const response = await openai.chat.completions.create({
    model: 'gpt-4-vision-preview',
    max_tokens: 1000,
    messages: [
      {
        role: 'user',
        content: [
          {
            type: 'text',
            text: `
- Parse the provided image to extract recipe information that complies with our Zod schema definitions.
- If an ingredient's measurement or unit is absent, leave these fields empty ("").
- Convert all fraction quantities to decimal format before submission (e.g., "1/2" should be submitted as "0.5").
- Include all fields as defined in the Zod schema. For any values not present in the image:
    - Use an empty string "" for string fields.
    - Use 0 for number fields.
- The response must be returned in JSON format.
- Choose one or more appropriate categories from this list: ${JSON.stringify(categories)}

Omit fields that allow null values.

  export const ingredientSchema = z.object({
    id: z.union([z.string().uuid(), z.number()]).optional(),
    name: z.string().min(2, { message: 'Namnet måste vara minst 2 bokstäver långt' }),
    quantity: z.string(),
    measurement: z.string(),
    owner: z.string().email().optional(),
  });

  export type IngredientSchema = z.infer<typeof ingredientSchema>;

  export const instructionSchema = z.object({
    id: z.union([z.string().uuid(), z.number()]).optional(),
    step: z.string().min(2, { message: 'Steget måste vara minst 2 bokstäver långt' }),
    owner: z.string().email().optional(),
  });

  export type InstructionSchema = z.infer<typeof instructionSchema>;

  export const recipeSchema = z.object({
    id: z.string().uuid().optional(),
    name: z.string().min(2, { message: 'Namnet måste vara minst 2 bokstäver långt' }),
    author: z.string().optional(),
    url: z.union([z.string(), z.null()]).optional(),
    categories: z
      .array(z.string().min(2, { message: 'Namnet måste vara minst 2 bokstäver långt' }))
      .min(1, { message: 'Du behöver välja minst 1 kategori' }),
    date_published: z.string().optional(),
    date_modified: z.string().optional(),
    recipe_yield: z.number(),
    recipe_yield_name: z
      .string()
      .min(2, { message: 'Namnet på det receptet gör måste vara minst 2 bokstäver långt' }),
    prep_time: z.number(),
    cook_time: z.number(),
    ingredients: z.array(ingredientSchema).min(1, { message: 'Du behöver minst 1 ingrediens' }),
    instructions: z.array(instructionSchema).min(1, { message: 'Du behöver minst 1 instruktion' }),
    description: z.string(),
    image: z.union([z.string(), z.instanceof(Blob), z.null()]).optional(),
    owner: z.string().email({ message: 'Ogiltig e-postadress' }).optional(),
  });

  export type RecipeSchema = z.infer<typeof recipeSchema>;
  `,
          },
          {
            type: 'image_url',
            image_url: {
              url: `data:${mimeType};base64,${image}`,
            },
          },
        ],
      },
    ],
  });

  const jsonBlockRegex = /```json\n([\s\S]*?)\n```/;
  const matches = jsonBlockRegex.exec(response.choices[0].message.content ?? '');

  if (matches && matches[1]) {
    const jsonContent = matches[1].trim();

    try {
      const jsonObject = JSON.parse(jsonContent) as RecipeSchema;
      return jsonObject;
    } catch (error) {
      console.error('Failed to parse JSON content:', error);
      return null;
    }
  } else {
    console.error('No JSON content found');
    return null;
  }
};
