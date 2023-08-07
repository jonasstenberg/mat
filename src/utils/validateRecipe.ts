import { Errors } from '@/hooks/useRecipeErrors';
import { IngredientProps } from '@/types/recipe';

interface RecipeValidationProps {
  recipeName: string;
  description: string;
  ingredients: IngredientProps[];
  categories: string[];
}

interface RecipeValidationResult {
  valid: boolean;
  errors: Errors;
}

export const validateRecipe = ({
  recipeName,
  description,
  ingredients,
  categories,
}: RecipeValidationProps): RecipeValidationResult => {
  let valid = true;
  let errors = {};

  if (!recipeName.trim()) {
    errors = { ...errors, recipeName: 'Receptnamn krävs.' };
    valid = false;
  }

  if (!description.trim()) {
    errors = { ...errors, description: 'Beskrivning krävs.' };
    valid = false;
  }

  if (ingredients.length < 1 || !ingredients[0].name.trim()) {
    errors = { ...errors, ingredients: 'Minst en ingrediens krävs.' };
    valid = false;
  }

  if (categories.length < 1) {
    errors = { ...errors, categories: 'Minst en kategori krävs.' };
    valid = false;
  }

  return { valid, errors };
};
