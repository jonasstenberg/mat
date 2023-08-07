'use client';

import React, { useState } from 'react';

import { IngredientProps, RecipeProps } from '@/types/recipe';
import styles from '@/app/page.module.css';

interface Props {
  recipe: RecipeProps;
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
  const decimalPart = Math.round((n - intPart) * 100) / 100;

  const fractions: Record<number, string> = {
    0.125: '⅛',
    0.25: '¼',
    0.375: '⅜',
    0.5: '½',
    0.625: '⅝',
    0.75: '¾',
    0.875: '⅞',
  };

  if (fractions[decimalPart]) {
    return intPart > 0 ? `${intPart} ${fractions[decimalPart]}` : `${fractions[decimalPart]}`;
  }

  return intPart !== 0 ? String(intPart) : '';
};

const convertDecimalInStringToFraction = (input: string): string => {
  const pattern = /\d+\.\d+/g;

  return input.replace(pattern, (match) => convertDecimalToFraction(match));
};

export default function Ingredients({ recipe }: Props) {
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
      {ingredients.map((ingredient, i) => (
        <div key={i} className={styles.ingredient}>
          {!ingredient.name.startsWith('#') ? (
            <label htmlFor={ingredient.name} className={styles['ingredient-label']}>
              {`${convertDecimalToFraction(ingredient.quantity)} ${
                ingredient.measurement
              } ${convertDecimalInStringToFraction(ingredient.name)}`}
              <input
                className={styles['ingredient-input']}
                type="checkbox"
                value={ingredient.name}
                name="checked"
                checked={ingredient.isChecked}
                onChange={onChangeCheckBox}
                id={ingredient.name}
              />
              <span className={styles['ingredient-span']} />
            </label>
          ) : (
            <span className={styles['ingredient-topic']}>
              {ingredient.name.substring(1).trim()}
            </span>
          )}
        </div>
      ))}
    </>
  );
}
