import { useState } from 'react';
import { useRecipeModal } from './useRecipeModal';

export interface UseIngredientsHandlerProps {
  resetError: (
    field: keyof { recipeName?: string; description?: string; ingredients?: string }
  ) => void;
}

export const useIngredientsHandler = ({ resetError }: UseIngredientsHandlerProps) => {
  const { recipeFormData, setRecipeFormData } = useRecipeModal();
  const [addError, setAddError] = useState(false);

  const handleAddComponent = () => {
    const lastIngredient = recipeFormData.ingredients[recipeFormData.ingredients.length - 1];
    const isAddDisabled = lastIngredient?.name === '';

    if (isAddDisabled && recipeFormData.ingredients.length > 1) {
      setAddError(true);
      return;
    }
    setAddError(true);
    const newIngredient = {
      id: Date.now(),
      measurement: '',
      quantity: '',
      name: '',
    };
    setRecipeFormData({
      ...recipeFormData,
      ingredients: [...recipeFormData.ingredients, newIngredient],
    });
  };

  const handleRemoveComponent = (id: string | number) => {
    setRecipeFormData((prevRecipeFormData) => {
      const filtered = prevRecipeFormData?.ingredients?.filter(
        (ingredient) => ingredient.id !== id
      );
      if (!filtered?.length) {
        setAddError(false);
      } else {
        const lastIngredient = filtered[filtered.length - 1];
        const isAddDisabled = lastIngredient?.name === '';
        setAddError(isAddDisabled);
      }
      return {
        ...prevRecipeFormData,
        ingredients: filtered,
      };
    });
  };

  const handleChangeValue = (id: string | number, name: string, value: string) => {
    resetError('ingredients');
    setAddError(false); // TODO: only set to false if all inputs has something in the name field
    setRecipeFormData({
      ...recipeFormData,
      ingredients: recipeFormData.ingredients.map((ingredient) =>
        ingredient.id === id
          ? {
              ...ingredient,
              [name]: value,
            }
          : ingredient
      ),
    });
  };

  return {
    addError,
    handleAddComponent,
    handleRemoveComponent,
    handleChangeValue,
  };
};
