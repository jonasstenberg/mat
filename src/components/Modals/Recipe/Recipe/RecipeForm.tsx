'use client';

import {
  Box,
  Button,
  Fieldset,
  FileButton,
  Group,
  Image,
  NumberInput,
  Select,
  Stack,
  TagsInput,
  TextInput,
  Textarea,
} from '@mantine/core';
import { IconDeviceFloppy } from '@tabler/icons-react';
import React, { useEffect, useState } from 'react';
import { useForm, zodResolver } from '@mantine/form';
import { useRouter } from 'next/navigation';
import { notifications } from '@mantine/notifications';
import { useRecipeModal } from '@/hooks/useRecipeModal';
import { saveRecipe, updateRecipe } from '@/actions/recipe';
import { IngredientSchema, RecipeSchema, recipeSchema } from '@/types/recipe';
import { createFormData } from '@/utils/createFormData';
import { InstructionSection } from './InstructionSection';
import { IngredientSection } from './IngredientSection';
import { handleServerErrors } from '@/utils/handleServerErrors';
import { UNKNOWN_ERROR } from '@/utils/errors';
import { useAuthModal } from '@/hooks/useAuthModal';
import { yieldStepper } from '@/components/RecipeYieldSlider';

const defaultRecipeYield = process.env.NEXT_PUBLIC_DEFAULT_RECIPE_YIELD || '4';
const defaultRecipeYieldName = process.env.NEXT_PUBLIC_DEFAULT_RECIPE_YIELD_NAME || 'portioner';

type RecipeFormProps = {
  categories: string[];
};

const initialIngredient: IngredientSchema = {
  id: Date.now(),
  measurement: '',
  quantity: '',
  name: '',
};

const initialInstruction = {
  id: Date.now(),
  step: '',
};

export default function RecipeForm({ categories }: RecipeFormProps) {
  const [isLoading, setIsLoading] = useState<boolean>(false);
  const { handlers, recipeToUpdate, setRecipeToUpdate } = useRecipeModal();
  const [objectURL, setObjectURL] = useState<string | null>(null);
  const router = useRouter();
  const { user } = useAuthModal();

  const validateRecipeSchema = (recipe: RecipeSchema) => {
    try {
      const parsedData = recipeSchema.parse(recipe);
      return parsedData;
    } catch (error) {
      notifications.show(UNKNOWN_ERROR);
      console.error('Validation failed', error);
      setRecipeToUpdate(null);
      return null;
    }
  };

  const form = useForm<RecipeSchema>({
    validate: zodResolver(recipeSchema),
    initialValues: (recipeToUpdate && validateRecipeSchema(recipeToUpdate)) ?? {
      name: '',
      author: user?.name,
      categories: [],
      recipe_yield: Number(defaultRecipeYield),
      recipe_yield_name: defaultRecipeYieldName,
      prep_time: 0,
      cook_time: 0,
      ingredients: [initialIngredient],
      description: '',
      instructions: [initialInstruction],
      image: '',
    },
    transformValues: (values: RecipeSchema) => ({
      ...values,
      recipe_yield: Number(values.recipe_yield),
      prep_time: Number(values.prep_time) || 0,
      cook_time: Number(values.cook_time) || 0,
    }),
  });

  const onSubmit = async (recipe: RecipeSchema) => {
    const formData = createFormData<RecipeSchema>(recipe);

    if (recipeToUpdate) {
      const response = await updateRecipe(recipeToUpdate.id as string, formData);
      const isSuccess = await handleServerErrors(response, form);

      if (isSuccess) {
        handlers.close();
        router.refresh();
        notifications.show({
          title: 'Sparat!',
          message: 'Receptet är uppdaterat 😇',
        });
      }
    } else {
      const response = await saveRecipe(formData);
      const isSuccess = await handleServerErrors(response, form);

      if (isSuccess) {
        handlers.close();
        router.push(`/recipe/${response.success?.id}`);
        notifications.show({
          title: 'Sparat!',
          message: 'Nytt recept! 😇',
        });
      }
    }

    setIsLoading(false);
  };

  useEffect(() => {
    if (form.values.image instanceof Blob) {
      const newObjectURL = URL.createObjectURL(form.values.image);
      setObjectURL(newObjectURL);
    } else if (typeof form.values.image === 'string' && form.values.image.length) {
      const imageURL = `/api/image?filename=${form.values.image}`;
      setObjectURL(imageURL);
    } else {
      setObjectURL(null);
    }

    return () => {
      if (objectURL && form.values.image instanceof Blob) {
        URL.revokeObjectURL(objectURL);
      }
    };
  }, [form.values.image]);

  return (
    <Box
      component="form"
      onSubmit={form.onSubmit(async () => {
        const recipe: RecipeSchema = form.getTransformedValues();
        await onSubmit(recipe);
      })}
    >
      <Stack gap="sm" mt="lg">
        <TextInput
          label="Namn på receptet"
          placeholder="Linsgryta"
          withAsterisk
          data-autofocus
          {...form.getInputProps('name')}
        />
        <TextInput
          label="Receptmakare (person eller org)"
          placeholder="Hanna"
          data-autofocus
          {...form.getInputProps('author')}
        />
        <TagsInput
          label="Kategori"
          placeholder="Välj kategori"
          data={categories}
          {...form.getInputProps('categories')}
        />
        <Fieldset legend="Antal enheter">
          <Group grow preventGrowOverflow={false} wrap="nowrap">
            <Select
              label="Antal portioner"
              placeholder={defaultRecipeYield.toString()}
              w="15%"
              miw="7rem"
              withAsterisk
              data={yieldStepper.map((y) => y.label)}
              value={form.values.recipe_yield.toString()}
              onChange={(value) => form.setFieldValue('recipe_yield', Number(value))}
            />
            <TextInput
              label="Enhet"
              placeholder="Portioner"
              w="85%"
              withAsterisk
              {...form.getInputProps('recipe_yield_name')}
            />
          </Group>
        </Fieldset>
        <Fieldset legend="Tid (i minuter)">
          <Group grow preventGrowOverflow={false} wrap="nowrap">
            <NumberInput
              label="Prep"
              placeholder="0"
              w="50%"
              {...form.getInputProps('prep_time')}
            />
            <NumberInput
              label="Tillagning"
              placeholder=""
              w="50%"
              {...form.getInputProps('cook_time')}
            />
          </Group>
        </Fieldset>
        <Fieldset legend="Bilduppladdning">
          <Stack>
            <Group grow>
              <FileButton
                name="image"
                accept="image/*"
                onChange={(e: any) => form.setValues({ ...form.values, image: e })}
              >
                {(props) => <Button {...props}>Ladda upp bild</Button>}
              </FileButton>
              <Button
                disabled={!form.values.image}
                color="red"
                onClick={() => form.setValues({ ...form.values, image: null })}
              >
                Ta bort
              </Button>
            </Group>
            {objectURL && (
              <Image h={200} w="auto" fit="contain" src={objectURL} alt="Förhandsgranskning" />
            )}
          </Stack>
        </Fieldset>
        <IngredientSection ingredients={form.values.ingredients} form={form} />
        <Textarea
          placeholder="Beskrivning"
          styles={{
            input: {
              resize: 'vertical',
              height: '15rem',
            },
          }}
          withAsterisk
          {...form.getInputProps('description')}
        />
        <InstructionSection instructions={form.values.instructions} form={form} />
        <Button
          onClick={() => setIsLoading(true)}
          disabled={isLoading}
          loading={isLoading}
          leftSection={<IconDeviceFloppy size={20} />}
          type="submit"
        >
          Spara
        </Button>
      </Stack>
    </Box>
  );
}
