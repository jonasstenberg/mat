'use client'
import React, { useEffect, useState } from 'react'

import { Ingredient } from '@/types/ingredient'
import { Recipe } from '@/types/recipe'
import styles from './page.module.css'

interface Props {
  recipe: Recipe
}

export default function Ingredients({ recipe }: Props) {
  const [ingredients, setIngredients] = useState(
    recipe.ingredients.map((ingredient) => ({ name: ingredient, isChecked: false }))
  )

  const onChangeCheckBox = (e: { target: { checked: boolean; value: React.SetStateAction<string> } }) => {
    const { value, checked: isChecked } = e.target

    setIngredients((prev) =>
      prev.map((ct) => {
        if (ct.name === value) {
          ct.isChecked = isChecked
        }
        return ct
      })
    )
  }

  return (
    <>
      {ingredients.map((ingredient, i) => (
        <div key={i} className={styles.ingredient}>
          {!ingredient.name.startsWith('#') ? (
            <label htmlFor={ingredient.name} className={styles['ingredient-label']}>
              {ingredient.name}
              <input
                className={styles['ingredient-input']}
                type="checkbox"
                value={ingredient.name}
                name="checked"
                checked={ingredient.isChecked}
                onChange={onChangeCheckBox}
                id={ingredient.name}
              />
              <span className={styles['ingredient-span']}></span>
            </label>
          ) : (
            <span className={styles['ingredient-topic']}>{ingredient.name.substring(1).trim()}</span>
          )}
        </div>
      ))}
    </>
  )
}
