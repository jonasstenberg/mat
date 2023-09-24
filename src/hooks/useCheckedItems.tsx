'use client';

import { useEffect, useState } from 'react';
import { IngredientSchema } from '@/types/recipe';

export function useCheckedItems<T extends { id?: IngredientSchema['id'] }>(initialItems: T[]) {
  const [checkedItems, setCheckedItems] = useState(
    initialItems.map((item) => ({ ...item, isChecked: false }))
  );

  useEffect(() => {
    setCheckedItems(
      initialItems.map((item) => ({
        ...item,
        isChecked: false,
      }))
    );
  }, [initialItems]);

  const onToggleCheck = (id: string, isChecked: boolean) => {
    setCheckedItems((prev) =>
      prev.map((item) => {
        if (item.id === id) {
          return { ...item, isChecked };
        }
        return item;
      })
    );
  };

  return { checkedItems, setCheckedItems, onToggleCheck };
}
