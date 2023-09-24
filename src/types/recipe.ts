import { z } from 'zod';
import i18next from 'i18next';
import { zodI18nMap } from 'zod-i18n-map';
import translation from 'zod-i18n-map/locales/sv/zod.json';

i18next.init({
  lng: 'sv',
  resources: {
    sv: { zod: translation },
  },
});
z.setErrorMap(zodI18nMap);

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
  description: z.string().optional(),
  image: z.union([z.string(), z.instanceof(Blob), z.null()]).optional(),
  owner: z.string().email({ message: 'Ogiltig e-postadress' }).optional(),
});

export type RecipeSchema = z.infer<typeof recipeSchema>;
