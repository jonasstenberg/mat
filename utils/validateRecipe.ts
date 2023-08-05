import { Errors } from '@/hooks/useRecipeErrors';
import { IngredientProps } from '@/types/recipe';

interface RecipeValidationProps {
  recipeName: string;
  description: string;
  ingredients: IngredientProps[];
}

interface RecipeValidationResult {
  valid: boolean;
  errors: Errors;
}

export const validateRecipe = ({
  recipeName,
  description,
  ingredients,
}: RecipeValidationProps): RecipeValidationResult => {
  let valid = true;
  let errors = {};

  if (!recipeName.trim()) {
    errors = { ...errors, recipeName: 'Recipe name is required.' };
    valid = false;
  }

  if (!description.trim()) {
    errors = { ...errors, description: 'Description is required.' };
    valid = false;
  }

  if (ingredients.length < 1 || !ingredients[0].name.trim()) {
    errors = { ...errors, ingredients: 'At least one ingredient is required.' };
    valid = false;
  }

  return { valid, errors };
};
