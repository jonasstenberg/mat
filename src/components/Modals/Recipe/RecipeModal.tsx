'use client';

import { Modal, Stack, Tabs, TagsInput, Text, TextInput } from '@mantine/core';
import React, { useState } from 'react';
import '@mantine/dropzone/styles.css';

import { useMediaQuery } from '@mantine/hooks';
import { CategoryProps } from '@/types/recipe';
import { useErrors } from '@/hooks/useRecipeErrors';
import { useRecipeModal } from '@/hooks/useRecipeModal';
import RecipeForm from './Recipe/RecipeForm';
import LinkForm from './Link/LinkForm';
import ImageForm from './Image/ImageForm';

interface RecipeModalProps {
  categories: CategoryProps[];
}

export default function RecipeModal(props: RecipeModalProps) {
  const { opened, handlers, recipeToUpdate, recipeFormData, setRecipeFormData } = useRecipeModal();
  const isMobile = useMediaQuery('(max-width: 50em)');

  const [isLoading, setIsLoading] = useState<boolean>(false);
  const { errors, resetError } = useErrors();

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
        <Stack gap="sm" mt="lg">
          <TextInput
            label="Namn på receptet"
            placeholder="Linsgryta"
            withAsterisk
            data-autofocus
            value={recipeFormData?.name}
            onChange={(e) => {
              resetError('recipeName');
              setRecipeFormData({
                ...recipeFormData,
                name: e.currentTarget.value,
              });
            }}
            error={errors?.recipeName}
          />
          <TagsInput
            label="Kategori"
            placeholder="Välj kategori"
            data={props.categories.map((a) => a.name)}
            value={recipeFormData?.categories.map((category) => category.name)}
            onChange={(e) =>
              setRecipeFormData({
                ...recipeFormData,
                categories: e.map((c) => ({ name: c })),
              })
            }
          />
          <Text c="red" size="xs">
            {errors?.categories}
          </Text>
        </Stack>
        <Tabs.Panel value="recipe">
          <RecipeForm isLoading={isLoading} setIsLoading={setIsLoading} />
        </Tabs.Panel>
        <Tabs.Panel value="link">
          <LinkForm />
        </Tabs.Panel>
        <Tabs.Panel value="image">
          <ImageForm />
        </Tabs.Panel>
      </Tabs>
    </Modal>
  );
}
