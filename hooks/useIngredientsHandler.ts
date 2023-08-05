import { useState } from 'react';
import { IngredientProps } from '@/types/recipe';

export interface UseIngredientsHandlerProps {
  initialIngredients: { id: number; values: IngredientProps }[];
  resetError: (
    field: keyof { recipeName?: string; description?: string; ingredients?: string }
  ) => void;
}

export const useIngredientsHandler = ({
  initialIngredients,
  resetError,
}: UseIngredientsHandlerProps) => {
  const [ingredients, setIngredients] = useState(initialIngredients);
  const [addError, setAddError] = useState(false);

  const handleAddComponent = () => {
    const lastIngredient = ingredients[ingredients.length - 1];
    const isAddDisabled = lastIngredient?.values.name === '';

    if (isAddDisabled && ingredients.length > 1) {
      setAddError(true);
      return;
    }
    setAddError(true);
    const newIngredient = {
      id: Date.now(),
      values: { measurement: '', quantity: '', name: '' },
    };
    setIngredients((prevIngredients) => [...prevIngredients, newIngredient]);
  };

  const handleRemoveComponent = (id: number) => {
    setIngredients((prevIngredients) => {
      const filtered = prevIngredients.filter((ingredient) => ingredient.id !== id);
      if (!filtered.length) {
        setAddError(false);
      } else {
        const lastIngredient = filtered[filtered.length - 1];
        const isAddDisabled = lastIngredient?.values.name === '';
        setAddError(isAddDisabled);
      }
      return filtered;
    });
  };

  const handleChangeValue = (id: number, name: string, value: string) => {
    resetError('ingredients');
    setAddError(false);
    setIngredients((prevIngredients) =>
      prevIngredients.map((ingredient) =>
        ingredient.id === id
          ? { ...ingredient, values: { ...ingredient.values, [name]: value } }
          : ingredient
      )
    );
  };

  return {
    ingredients,
    setIngredients,
    addError,
    handleAddComponent,
    handleRemoveComponent,
    handleChangeValue,
  };
};
