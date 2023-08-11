'use client';

import React from 'react';
import { FileButton, Button, Image, Group, Fieldset, Stack } from '@mantine/core';
import { useRecipeModal } from '@/hooks/useRecipeModal';

const ImageUploader: React.FC = () => {
  const { recipeFormData, setRecipeFormData } = useRecipeModal();
  return (
    <Fieldset legend="Bilduppladdning">
      <Stack>
        <Group grow>
          <FileButton
            onChange={(value) =>
              setRecipeFormData({
                ...recipeFormData,
                image: value,
              })
            }
            accept="image/*"
          >
            {(props) => <Button {...props}>Ladda upp bild</Button>}
          </FileButton>
          <Button
            disabled={!recipeFormData?.image}
            color="red"
            onClick={() =>
              setRecipeFormData({
                ...recipeFormData,
                image: null,
              })
            }
          >
            Ta bort
          </Button>
        </Group>
        {recipeFormData?.image && (
          <Image
            h={200}
            w="auto"
            fit="cover"
            src={
              typeof recipeFormData.image === 'string'
                ? `/api/image?filename=${recipeFormData.image}`
                : URL.createObjectURL(recipeFormData.image)
            }
            alt="Förhandsgranskning"
          />
        )}
      </Stack>
    </Fieldset>
  );
};

export default ImageUploader;
