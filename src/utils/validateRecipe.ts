import { Errors } from '@/contexts/ErrorContext';
import { RecipeSchema } from '@/types/recipe';

type RecipeValidationResult = {
  valid: boolean;
  errors: Errors;
};

export const validateRecipe = (recipe: RecipeSchema): RecipeValidationResult => {
  let valid = true;
  let errors = {};

  if (!recipe.name?.trim()) {
    errors = { ...errors, recipeName: 'Receptnamn krävs.' };
    valid = false;
  }

  if (!recipe.description?.trim()) {
    errors = { ...errors, description: 'Beskrivning krävs.' };
    valid = false;
  }

  if (!recipe.ingredients || recipe.ingredients.length < 1 || !recipe.ingredients[0].name?.trim()) {
    errors = { ...errors, ingredients: 'Minst en ingrediens krävs.' };
    valid = false;
  }

  if (!recipe.categories || recipe.categories.length < 1) {
    errors = { ...errors, categories: 'Minst en kategori krävs.' };
    valid = false;
  }

  return { valid, errors };
};
