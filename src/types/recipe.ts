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
  id: z.union([z.string().uuid(), z.number()]),
  name: z.string().min(2, { message: 'Namnet måste vara minst 2 bokstäver långt' }),
  quantity: z.string(),
  measurement: z.string(),
  owner: z.string().email().optional(),
});

export type IngredientSchema = z.infer<typeof ingredientSchema>;

export const recipeSchema = z.object({
  id: z.string().uuid().optional(),
  name: z.string().min(2, { message: 'Namnet måste vara minst 2 bokstäver långt' }),
  categories: z
    .array(z.string().min(2, { message: 'Namnet måste vara minst 2 bokstäver långt' }))
    .min(1, { message: 'Du behöver välja minst 1 kategori' }),
  date_added: z.string().optional(),
  date_updated: z.string().optional(),
  servings: z.number(),
  servings_name: z
    .string()
    .min(2, { message: 'Serveringsnamnet måste vara minst 2 bokstäver långt' }),
  prep_time: z.number(),
  cook_time: z.number(),
  ingredients: z.array(ingredientSchema).min(1, { message: 'Du behöver minst 1 ingrediens' }),
  description: z.string().min(2, { message: 'Beskrivningen måste vara minst 2 bokstäver långt' }),
  image: z.union([z.string(), z.instanceof(Blob), z.null()]),
  owner: z.string().email({ message: 'Ogiltig e-postadress' }).optional(),
});

export type RecipeSchema = z.infer<typeof recipeSchema>;
