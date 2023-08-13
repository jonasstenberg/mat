import {
  Button,
  Fieldset,
  Group,
  NumberInput,
  Select,
  Stack,
  TextInput,
  Textarea,
} from '@mantine/core';
import React, { useEffect, useTransition } from 'react';
import { useRouter } from 'next/navigation';

import { IconDeviceFloppy } from '@tabler/icons-react';
import { useIngredientsHandler } from '@/hooks/useIngredientsHandler';
import { useErrors } from '@/hooks/useRecipeErrors';
import { RecipeProps } from '@/types/recipe';
import { useRecipeModal } from '@/hooks/useRecipeModal';
import { validateRecipe } from '@/utils/validateRecipe';
import ImageUploader from './ImageUploader';
import IngredientsFieldset from './IngredientsFieldset';

const defaultServings = process.env.NEXT_PUBLIC_DEFAULT_SERVINGS || '4';
const baseUrl = process.env.NEXT_PUBLIC_BASE_URL;

const uploadImage = async (id: string | undefined, image: File) => {
  const formData = new FormData();
  formData.append('file', image);

  try {
    const imageRes = await fetch(`${baseUrl}/api/image?recipe_id=${id}`, {
      method: 'POST',
      body: formData,
    });

    if (!imageRes.ok) {
      throw new Error(`Response not ok ${imageRes.status} ${imageRes.statusText}`);
    }

    const { filename } = await imageRes.json();
    return filename;
  } catch (err) {
    console.error(err);
    return null;
  }
};

const saveRecipe = async (r: RecipeProps, callback: (id: string) => void) => {
  const res = await fetch(`${baseUrl}/api/recipe`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      recipe: {
        ...r,
        categories: r.categories?.map((category) => ({ name: category })),
      },
    }),
  });

  const id = await res.json();

  if (r.image instanceof File) {
    const filename = await uploadImage(id, r.image);

    await fetch(`${baseUrl}/api/recipe`, {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        recipeId: id,
        recipeToUpdate: {
          ...r,
          image: filename,
        },
      }),
    });
  }

  callback(id);
};

const updateRecipe = async (
  recipeId: string | undefined,
  recipeToUpdate: RecipeProps,
  callback: () => void
) => {
  let filename = null;
  if (recipeToUpdate.image instanceof File) {
    filename = await uploadImage(recipeId, recipeToUpdate.image);
  }

  await fetch(`${baseUrl}/api/recipe`, {
    method: 'PUT',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      recipeId,
      recipeToUpdate: filename
        ? {
          ...recipeToUpdate,
          ...recipeToUpdate,
          image: filename,
        }
        : recipeToUpdate,
    }),
  });
  callback();
};

interface Props {
  isLoading: boolean;
  setIsLoading: (loading: boolean) => void;
}

export default function RecipeForm({ isLoading, setIsLoading }: Props) {
  const router = useRouter();
  const [, startTransition] = useTransition();

  const { errors, setErrors, resetError } = useErrors();
  const { handlers, recipeFormData, setRecipeFormData, recipeToUpdate } = useRecipeModal();

  useEffect(() => {
    setRecipeFormData((prevRecipeFormData) => {
      if (!recipeToUpdate) return prevRecipeFormData;

      const { ingredients, ...restOfRecipeToUpdate } = recipeToUpdate;

      return {
        ...prevRecipeFormData,
        ...restOfRecipeToUpdate,
        ingredients:
          ingredients?.map((ingredient, index) => ({
            ...ingredient,
            id: index,
          })) ?? prevRecipeFormData.ingredients,
      };
    });
  }, [recipeToUpdate]);

  const { addError, handleAddComponent, handleRemoveComponent, handleChangeValue } =
    useIngredientsHandler({ resetError });

  return (
    <Stack gap="sm">
      <Fieldset legend="Antal enheter">
        <Group grow preventGrowOverflow={false} wrap="nowrap">
          <Select
            label="Antal portioner"
            placeholder={defaultServings.toString()}
            w="15%"
            miw="7rem"
            withAsterisk
            value={recipeFormData?.servings.toString()}
            data={Array.from({ length: 12 }, (_, index) => ((index + 1) * 2).toString())}
            onChange={(value) =>
              setRecipeFormData({
                ...recipeFormData,
                servings: Number(value),
              })
            }
          />
          <TextInput
            label="Enhet"
            placeholder="Portioner"
            w="85%"
            withAsterisk
            value={recipeFormData.servings_name}
            onChange={(e) => {
              setRecipeFormData({
                ...recipeFormData,
                servings_name: e.currentTarget.value,
              });
            }}
          />
        </Group>
      </Fieldset>
      <Fieldset legend="Tid (i minuter)">
        <Group grow preventGrowOverflow={false} wrap="nowrap">
          <NumberInput
            label="Prep"
            placeholder="0"
            w="50%"
            withAsterisk
            value={recipeFormData?.prep_time}
            onChange={(value) =>
              setRecipeFormData({
                ...recipeFormData,
                prep_time: Number(value),
              })
            }
          />
          <NumberInput
            label="Tillagning"
            placeholder=""
            w="50%"
            withAsterisk
            value={recipeFormData?.cook_time}
            onChange={(value) =>
              setRecipeFormData({
                ...recipeFormData,
                cook_time: Number(value),
              })
            }
          />
        </Group>
      </Fieldset>
      <ImageUploader />
      <IngredientsFieldset
        ingredients={recipeFormData?.ingredients}
        handleAddComponent={handleAddComponent}
        handleRemoveComponent={handleRemoveComponent}
        handleChangeValue={handleChangeValue}
        error={errors?.ingredients}
        addError={addError}
      />
      <Textarea
        placeholder="Beskrivning"
        styles={{
          input: {
            resize: 'vertical',
            height: '15rem',
          },
        }}
        withAsterisk
        value={recipeFormData?.description}
        onChange={(e) => {
          resetError('description');
          setRecipeFormData({
            ...recipeFormData,
            description: e.currentTarget.value,
          });
        }}
        error={errors?.description}
      />
      <Button
        leftSection={<IconDeviceFloppy size={20} />}
        onClick={async (e) => {
          e.preventDefault();
          setIsLoading(true);

          const recipe: RecipeProps = {
            name: recipeFormData.name,
            servings: recipeFormData.servings,
            servings_name: recipeFormData.servings_name,
            prep_time: recipeFormData.prep_time,
            cook_time: recipeFormData.cook_time,
            categories: recipeFormData.categories,
            description: recipeFormData.description,
            image: recipeFormData.image,
            ingredients: recipeFormData.ingredients,
          };
          const validate = validateRecipe(recipe);

          setErrors(validate.errors);
          setIsLoading(false);

          if (validate.valid) {
            recipeToUpdate
              ? await updateRecipe(recipeToUpdate.id, recipe, async () => {
                await fetch(`/api/revalidate?path=/recipe/${recipeToUpdate.id}`);
                handlers.close();
                startTransition(() => {
                  window.location.reload();
                });
              })
              : await saveRecipe(recipe, (id: string) => {
                setIsLoading(false);
                handlers.close();
                router.replace(`/recipe/${id}`);
              });
          }
        }}
        loading={isLoading}
      >
        Spara
      </Button>
    </Stack>
  );
}
