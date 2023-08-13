'use client';

import React, { useState } from 'react';

import styles from './styles.module.css';
import { IngredientProps, RecipeProps } from '@/types/recipe';

interface Props {
  recipe: RecipeProps;
  servings: number;
}

interface IngredientsCheckedProps extends IngredientProps {
  isChecked: boolean;
}

const convertDecimalToFraction = (input: string): string => {
  if (!input) {
    return '';
  }

  const n = Number(input);
  if (Number.isNaN(n)) {
    return input;
  }

  const intPart = Math.floor(n);
  const decimalPart = n - intPart;

  // Define the maximum denominator (e.g., 5 for fractions up to x/5)
  const maxDenominator = 5;

  let bestNumerator = 0;
  let bestDenominator = 1;
  let minDifference = decimalPart;

  // Iterate over possible denominators, find the numerator that minimizes the difference
  for (let denominator = 1; denominator <= maxDenominator; denominator += 1) {
    const numerator = Math.round(decimalPart * denominator);
    const difference = Math.abs(decimalPart - numerator / denominator);

    if (difference < minDifference) {
      bestNumerator = numerator;
      bestDenominator = denominator;
      minDifference = difference;
    }
  }

  let fractionString = `${bestNumerator}/${bestDenominator}`;
  if (bestNumerator === 0) {
    fractionString = '';
  } else if (bestDenominator === 1) {
    fractionString = String(bestNumerator);
  }

  return intPart > 0 ? `${intPart} ${fractionString}` : fractionString;
};

const convertDecimalInStringToFraction = (input: string): string => {
  const pattern = /\d+\.\d+/g;

  return input.replace(pattern, (match) => convertDecimalToFraction(match));
};

const fractionToDecimal = (fraction: string) => {
  const [numerator, denominator] = fraction.split('/').map(Number);
  return denominator ? numerator / denominator : numerator;
};

const normalizeIngredient = (
  ingredient: { quantity: string; measurement: string; name: string },
  recipeServings: number,
  newServings: number
) => {
  // Normalize ingredient.quantity
  let normalizedQuantity = (Number(ingredient.quantity) / recipeServings) * newServings;

  if (ingredient.measurement === 'g') {
    normalizedQuantity = Math.round(normalizedQuantity); // Round to the nearest whole number if measurement is "g"
  }

  const quantityString =
    ingredient.measurement === 'g'
      ? normalizedQuantity.toString()
      : convertDecimalToFraction(normalizedQuantity.toString());

  // Check if ingredient.name contains a pattern like "(1/2 dl)" or "(ca 1/2 dl)"
  let { name } = ingredient;
  const matches = name.match(/\((.+?)\)/);
  if (matches) {
    const contentInsideParens = matches[1];
    const quantityMatch = contentInsideParens.match(/([\d/\\.]+)/);
    if (quantityMatch) {
      const originalQuantity = fractionToDecimal(quantityMatch[1]);
      const normalizedQuantityInName = (originalQuantity / recipeServings) * newServings;
      const fractionString = convertDecimalToFraction(normalizedQuantityInName.toString());
      const updatedContent = contentInsideParens.replace(quantityMatch[1], fractionString);
      name = name.replace(matches[0], `(${updatedContent})`);
    }
  }

  return {
    quantity: quantityString,
    measurement: ingredient.measurement,
    name,
  };
};

export default function Ingredients({ servings, recipe }: Props) {
  const [ingredients, setIngredients] = useState<IngredientsCheckedProps[]>(
    recipe.ingredients.map((ingredient: IngredientProps) => ({
      ...ingredient,
      isChecked: false,
    }))
  );

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
        const normalizedIngredient = normalizeIngredient(ingredient, recipe.servings, servings);
        return (
          <div key={i} className={styles.ingredient}>
            {!normalizedIngredient.name.startsWith('#') ? (
              <label htmlFor={normalizedIngredient.name} className={styles['ingredient-label']}>
                {`${convertDecimalToFraction(normalizedIngredient.quantity)} ${normalizedIngredient.measurement
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
