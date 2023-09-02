'use client';

import React, { ChangeEvent } from 'react';
import styles from '@/app/page.module.css';

interface CheckableItemProps<T> {
  item: T & { isChecked: boolean };
  renderLabel: () => string;
  onToggleCheck: (id: string, isChecked: boolean) => void;
  id: string;
}

function CheckableItem<T>({ item, renderLabel, onToggleCheck, id }: CheckableItemProps<T>) {
  const onChange = (e: ChangeEvent<HTMLInputElement>) => {
    const { checked } = e.target;
    onToggleCheck(id, checked);
  };

  return (
    <div className={styles['checkable-item']}>
      <label htmlFor={id} className={styles['checkable-item-label']}>
        {renderLabel()}
        <input
          className={styles['checkable-item-input']}
          type="checkbox"
          value={id}
          name="checked"
          checked={item.isChecked}
          onChange={onChange}
          id={id}
        />
        <span className={styles['checkable-item-span']} />
      </label>
    </div>
  );
}

export default CheckableItem;
