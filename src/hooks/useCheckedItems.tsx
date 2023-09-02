'use client';

import { useEffect, useState } from 'react';

export function useCheckedItems<T extends { id: string | number }>(initialItems: T[]) {
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
