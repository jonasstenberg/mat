'use client';

import { Modal, Tabs } from '@mantine/core';
import React from 'react';

import { useMediaQuery } from '@mantine/hooks';
import { useRecipeModal } from '@/hooks/useRecipeModal';
import RecipeForm from './Recipe/RecipeForm';

type RecipeModalProps = {
  categories: string[];
};

export default function RecipeModal({ categories }: RecipeModalProps) {
  const { opened, handlers, recipeToUpdate } = useRecipeModal();
  const isMobile = useMediaQuery('(max-width: 50em)');

  return (
    <Modal
      opened={opened}
      onClose={handlers.close}
      title={recipeToUpdate ? 'Redigera recept' : 'Lägg till recept'}
      overlayProps={{
        backgroundOpacity: 0.55,
        blur: 3,
      }}
      size="xl"
      fullScreen={isMobile}
    >
      <Tabs defaultValue="recipe">
        <Tabs.List>
          <Tabs.Tab value="recipe">Recept</Tabs.Tab>
          <Tabs.Tab value="link" disabled>
            Länk
          </Tabs.Tab>
          <Tabs.Tab value="image" disabled>
            Bild
          </Tabs.Tab>
        </Tabs.List>
        <Tabs.Panel value="recipe">
          <RecipeForm categories={categories} />
        </Tabs.Panel>
        <Tabs.Panel value="link">
          <p> </p>
        </Tabs.Panel>
        <Tabs.Panel value="image">
          <p> </p>
        </Tabs.Panel>
      </Tabs>
    </Modal>
  );
}
