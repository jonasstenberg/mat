'use client';

import React from 'react';

import { RecipeSchema } from '@/types/recipe';
import {
  convertDecimalInStringToFraction,
  convertDecimalToFraction,
  normalizeIngredient,
} from '@/utils/ingredientParser';
import CheckableItem from '@/components/CheckableItem';
import { useCheckedItems } from '@/hooks/useCheckedItems';

type IngredientsProps = {
  recipe: RecipeSchema;
  recipeYield: number;
};

export default function Ingredients({ recipeYield, recipe }: IngredientsProps) {
  const { checkedItems, onToggleCheck } = useCheckedItems(recipe.ingredients);

  return (
    <>
      <h4>Ingredienser</h4>
      {checkedItems.map((ingredient) => {
        const normalizedIngredient = normalizeIngredient(
          ingredient,
          recipe.recipe_yield,
          recipeYield
        );
        return (
          <CheckableItem
            key={ingredient.id}
            item={ingredient}
            id={String(ingredient.id)}
            onToggleCheck={onToggleCheck}
            renderLabel={() =>
              `${convertDecimalToFraction(normalizedIngredient.quantity)} ${
                normalizedIngredient.measurement
              } ${convertDecimalInStringToFraction(normalizedIngredient.name)}`
            }
          />
        );
      })}
    </>
  );
}
