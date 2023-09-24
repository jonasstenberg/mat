import { Box, Stack, TextInput, Button, Center, Loader } from '@mantine/core';
import { notifications } from '@mantine/notifications';
import React, { ClipboardEvent, useCallback, useState } from 'react';
import { z } from 'zod';
import { useForm, zodResolver } from '@mantine/form';

import { UNKNOWN_ERROR } from '@/utils/errors';
import { scrapeJsonLd } from '@/actions/ldjsonScraper';
import { useRecipeModal } from '@/hooks/useRecipeModal';

const recipeUrlSchema = z.object({
  url: z.string().url(),
});

type RecipeUrlSchema = z.infer<typeof recipeUrlSchema>;

export default function LinkForm() {
  const [isLoading, setIsLoading] = useState<boolean>(false);
  const { setFormRecipe } = useRecipeModal();

  const form = useForm<RecipeUrlSchema>({
    validate: zodResolver(recipeUrlSchema),
    initialValues: {
      url: '',
    },
  });

  const addRecipeFromLink = async (scrapeUrl: string) => {
    try {
      setIsLoading(true);
      const data = await scrapeJsonLd(scrapeUrl);
      if (data) {
        setFormRecipe({
          ...data,
          url: scrapeUrl,
        });
      }
    } catch (error) {
      notifications.show(UNKNOWN_ERROR);
    } finally {
      setIsLoading(false);
    }
  };

  const onSubmit = async (url: string) => {
    await addRecipeFromLink(url);
  };

  const onSubmitHandler = useCallback(
    async (recipeUrl: RecipeUrlSchema) => {
      await onSubmit(recipeUrl.url);
    },
    [onSubmit]
  );

  const onPaste = async (e: ClipboardEvent<HTMLInputElement>) => {
    const pastedData = e.clipboardData?.getData('text');
    const parsed = recipeUrlSchema.safeParse({ url: pastedData });

    if (!parsed.success) {
      notifications.show({
        title: 'Ogiltig URL',
        message: 'Den inklistrade texten är inte en giltig URL.',
      });
      return;
    }

    await addRecipeFromLink(pastedData);
  };
  return (
    <>
      <Box component="form" onSubmit={form.onSubmit(onSubmitHandler)}>
        <Stack>
          <TextInput
            onPaste={onPaste}
            disabled={isLoading}
            label="Länk till receptet"
            placeholder="Klistra in en giltig recept-URL, t.ex. https://example.com/ditt-recept"
            mt="lg"
            {...form.getInputProps('url')}
          />
          <Button type="submit" disabled={isLoading}>
            Lägg till recept
          </Button>
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
