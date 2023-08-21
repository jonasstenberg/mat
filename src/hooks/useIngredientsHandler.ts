import { useState } from 'react';
import { useRecipeModal } from './useRecipeModal';

export interface UseIngredientsHandlerProps {
  resetError: (
    field: keyof { recipeName?: string; description?: string; ingredients?: string }
  ) => void;
}

export const useIngredientsHandler = ({ resetError }: UseIngredientsHandlerProps) => {
  const { setRecipeFormData } = useRecipeModal();
  const [addError, setAddError] = useState(false);

  const handleAddComponent = () => {
    setRecipeFormData((prevRecipeFormData) => {
      const lastIngredient =
        prevRecipeFormData.ingredients[prevRecipeFormData.ingredients.length - 1];
      const isAddDisabled = lastIngredient?.name === '';

      if (isAddDisabled && prevRecipeFormData.ingredients.length > 1) {
        setAddError(true);
        return prevRecipeFormData;
      }

      const newIngredient = {
        id: Date.now(),
        measurement: '',
        quantity: '',
        name: '',
      };

      return {
        ...prevRecipeFormData,
        ingredients: [...prevRecipeFormData.ingredients, newIngredient],
      };
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

    setRecipeFormData((prevRecipeFormData) => ({
      ...prevRecipeFormData,
      ingredients: prevRecipeFormData.ingredients.map((ingredient) =>
        ingredient.id === id
          ? {
              ...ingredient,
              [name]: value.replace(',', '.'),
            }
          : ingredient
      ),
    }));
  };

  return {
    addError,
    handleAddComponent,
    handleRemoveComponent,
    handleChangeValue,
  };
};
