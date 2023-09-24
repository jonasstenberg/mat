'use client';

import { Modal, Tabs } from '@mantine/core';
import React from 'react';

import { useMediaQuery } from '@mantine/hooks';
import { useRecipeModal } from '@/hooks/useRecipeModal';
import RecipeForm from './Recipe/RecipeForm';
import LinkForm from './Recipe/LinkForm';

type RecipeModalProps = {
  categories: string[];
};

export default function RecipeModal({ categories }: RecipeModalProps) {
  const { opened, handlers, formRecipe } = useRecipeModal();
  const isMobile = useMediaQuery('(max-width: 832px)');

  return (
    <Modal
      opened={opened}
      onClose={handlers.close}
      title={formRecipe ? 'Redigera recept' : 'Lägg till recept'}
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
          <Tabs.Tab value="link" disabled={!!formRecipe?.id}>
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
          <LinkForm />
          {!!formRecipe && <RecipeForm categories={categories} />}
        </Tabs.Panel>
        <Tabs.Panel value="image">{null}</Tabs.Panel>
      </Tabs>
    </Modal>
  );
}
