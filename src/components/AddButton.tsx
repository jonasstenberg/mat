'use client';

import { ActionIcon, Button } from '@mantine/core';
import { useMediaQuery } from '@mantine/hooks';

import { IconPlus } from '@tabler/icons-react';
import styles from '../app/page.module.css';
import { useRecipeModal } from '@/hooks/useRecipeModal';

export default function AddButton() {
  const { handlers } = useRecipeModal();
  const mid = useMediaQuery('(min-width: 832px)');

  return mid ? (
    <Button
      radius={mid ? 'md' : 'xl'}
      className={styles['add-button']}
      onClick={() => handlers.open()}
    >
      {mid ? 'Lägg till recept' : '+'}
    </Button>
  ) : (
    <ActionIcon
      variant="filled"
      aria-label="Lägg till recept"
      className={styles['add-button']}
      onClick={() => handlers.open()}
    >
      <IconPlus />
    </ActionIcon>
  );
}
