'use client';

import React, { useEffect, useState } from 'react';

import styles from './styles.module.css';
import { IngredientSchema, RecipeSchema } from '@/types/recipe';
import {
  convertDecimalInStringToFraction,
  convertDecimalToFraction,
  normalizeIngredient,
} from '@/utils/ingredientParser';

type IngredientsProps = {
  recipe: RecipeSchema;
  recipeYield: number;
};

type IngredientsCheckedProps = IngredientSchema & {
  isChecked: boolean;
};

export default function Ingredients({ recipeYield, recipe }: IngredientsProps) {
  const [ingredients, setIngredients] = useState<IngredientsCheckedProps[]>(
    recipe.ingredients.map((ingredient: IngredientSchema) => ({
      ...ingredient,
      isChecked: false,
    }))
  );

  useEffect(() => {
    setIngredients(
      recipe.ingredients.map((ingredient: IngredientSchema) => ({
        ...ingredient,
        isChecked: false,
      }))
    );
  }, [recipe.ingredients]);

  const onChangeCheckBox = (e: {
    target: { checked: boolean; value: React.SetStateAction<string> };
  }) => {
    const { value, checked: isChecked } = e.target;

    setIngredients((prev) =>
      prev.map((ct) => {
        if (ct.name === value) {
          return { ...ct, isChecked };
        }
        return ct;
      })
    );
  };

  return (
    <>
      <h4>Ingredienser</h4>
      {ingredients.map((ingredient, i) => {
        const normalizedIngredient = normalizeIngredient(
          ingredient,
          recipe.recipe_yield,
          recipeYield
        );
        return (
          <div key={i} className={styles.ingredient}>
            {!normalizedIngredient.name.startsWith('#') ? (
              <label htmlFor={normalizedIngredient.name} className={styles['ingredient-label']}>
                {`${convertDecimalToFraction(normalizedIngredient.quantity)} ${
                  normalizedIngredient.measurement
                } ${convertDecimalInStringToFraction(normalizedIngredient.name)}`}
                <input
                  className={styles['ingredient-input']}
                  type="checkbox"
                  value={ingredient.name}
                  name="checked"
                  checked={ingredient.isChecked}
                  onChange={onChangeCheckBox}
                  id={normalizedIngredient.name}
                />
                <span className={styles['ingredient-span']} />
              </label>
            ) : (
              <span className={styles['ingredient-topic']}>
                {normalizedIngredient.name.substring(1).trim()}
              </span>
            )}
          </div>
        );
      })}
    </>
  );
}
