'use client';

import React from 'react';

import styles from './styles.module.css';
import { InstructionSchema } from '@/types/recipe';
import CheckableItem from '@/components/CheckableItem';
import { useCheckedItems } from '@/hooks/useCheckedItems';

type InstructionsProps = {
  instructions: InstructionSchema[];
};

export default function Instructions({ instructions }: InstructionsProps) {
  const { checkedItems, onToggleCheck } = useCheckedItems(instructions);

  return (
    <section className={styles['recipe-instructions']}>
      <h4>Instruktioner</h4>
      <ul className={styles['recipe-steps']}>
        {checkedItems?.map((instruction, index) => (
          <li className={styles['recipe-step']} key={index}>
            <div className={styles['recipe-step-number']}>Steg {index + 1}</div>
            <CheckableItem
              key={instruction.id}
              item={instruction}
              id={String(instruction.id)}
              onToggleCheck={onToggleCheck}
              renderLabel={() => instruction.step}
            />
          </li>
        ))}
      </ul>
    </section>
  );
}
