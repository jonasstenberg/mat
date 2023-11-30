import { Box, Stack, Center, Loader, FileInput } from '@mantine/core';
import { notifications } from '@mantine/notifications';
import React, { useState } from 'react';
import { z } from 'zod';
import { useForm, zodResolver } from '@mantine/form';

import { UNKNOWN_ERROR } from '@/utils/errors';
import { getRecipeUsingOpenaiVision } from '@/actions/recipe';
import { useRecipeModal } from '@/hooks/useRecipeModal';

const recipeImageSchema = z.object({
  image: z.union([z.instanceof(File), z.null()]),
});

type RecipeImageSchema = z.infer<typeof recipeImageSchema>;

export default function ImageForm() {
  const [isLoading, setIsLoading] = useState<boolean>(false);
  const { setFormRecipe } = useRecipeModal();

  const form = useForm<RecipeImageSchema>({
    validate: zodResolver(recipeImageSchema),
    initialValues: {
      image: null,
    },
  });

  const submitImage = async (values: RecipeImageSchema) => {
    if (!values.image) {
      notifications.show({ message: 'No image provided.', color: 'red' });
      return;
    }

    try {
      setIsLoading(true);
      const fileReader = new FileReader();
      fileReader.readAsDataURL(values.image);
      fileReader.onload = async () => {
        const base64 = fileReader.result as string;
        const base64Image = base64.split(',')[1];
        const mimeType = values.image?.type;
        const recipe = await getRecipeUsingOpenaiVision(base64Image, mimeType ?? '');

        setFormRecipe(recipe);
        setIsLoading(false);
      };
      fileReader.onerror = () => {
        notifications.show({
          title: '😱',
          message: 'Kunde inte ladda in bilden',
        });
        setIsLoading(false);
      };
    } catch (error) {
      notifications.show(UNKNOWN_ERROR);
    }
  };

  const handleImageChange = (imageFile: File | null) => {
    form.setFieldValue('image', imageFile);

    if (imageFile) {
      submitImage({ image: imageFile });
    }
  };

  return (
    <>
      <Box>
        <Stack>
          <FileInput
            label="Bild på ett recept"
            placeholder="Välj en bild på ett recept"
            mt="lg"
            accept="image/png,image/jpeg"
            clearable
            disabled={isLoading}
            onChange={handleImageChange}
          />
        </Stack>
      </Box>
      {isLoading && (
        <Center mt="lg" mb="xs">
          <Loader />
        </Center>
      )}
    </>
  );
}
