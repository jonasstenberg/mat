'use client';

import {
  Button,
  Drawer,
  NumberInput,
  Select,
  Stack,
  TagsInput,
  Text,
  TextInput,
  Textarea,
} from '@mantine/core';
import { IconDeviceFloppy } from '@tabler/icons-react';
import React, { useEffect, useState, useTransition } from 'react';
import { useRouter } from 'next/navigation';

import { RecipeProps, CategoryProps } from '@/types/recipe';
import ImageUploader from './RecipeDrawer/ImageUploader';
import IngredientsFieldset from './RecipeDrawer/IngredientsFieldset';
import useImageUploader from '@/hooks/useImageUploader';
import { useIngredientsHandler } from '@/hooks/useIngredientsHandler';
import { useErrors } from '@/hooks/useRecipeErrors';
import { validateRecipe } from '@/utils/validateRecipe';
import { useRecipeDrawer } from '@/hooks/useRecipeDrawer';

const baseUrl = process.env.NEXT_PUBLIC_BASE_URL;
const defaultServings = process.env.NEXT_PUBLIC_DEFAULT_SERVINGS || '4';

interface RecipeDrawerProps {
  categories: CategoryProps[];
}

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

export default function RecipeDrawer(props: RecipeDrawerProps) {
  const router = useRouter();
  const [isPending, startTransition] = useTransition();

  const { opened, handlers, recipeToUpdate } = useRecipeDrawer();

  const [isLoading, setIsLoading] = useState<boolean>(false);
  const { errors, setErrors, resetError } = useErrors();

  const [recipeName, setRecipeName] = useState<string>(recipeToUpdate?.name || '');
  const [servings, setServings] = useState<string | null>(
    recipeToUpdate?.servings.toString() || defaultServings
  );
  const [prep_time, setPrepTime] = useState<string | number>(recipeToUpdate?.prep_time || 0);
  const [cook_time, setCookTime] = useState<string | number>(recipeToUpdate?.cook_time || 0);
  const [categories, setCategories] = useState<string[]>(
    recipeToUpdate?.categories?.map((category) => category.name) || []
  );
  const { image, setImage, clearImage } = useImageUploader(recipeToUpdate?.image || null);
  const [description, setDescription] = useState<string>(recipeToUpdate?.description || '');

  const initialIngredients = recipeToUpdate?.ingredients?.map((ingredient, index) => ({
    id: index,
    values: { ...ingredient },
  })) || [{ id: Date.now(), values: { measurement: '', quantity: '', name: '' } }];

  const {
    ingredients,
    setIngredients,
    addError,
    handleAddComponent,
    handleRemoveComponent,
    handleChangeValue,
  } = useIngredientsHandler({ initialIngredients, resetError });

  useEffect(() => {
    setRecipeName(recipeToUpdate?.name || '');
  }, [recipeToUpdate?.name]);

  useEffect(() => {
    setServings(recipeToUpdate?.servings.toString() || defaultServings);
  }, [recipeToUpdate?.servings]);

  useEffect(() => {
    setPrepTime(recipeToUpdate?.prep_time || 0);
  }, [recipeToUpdate?.prep_time]);

  useEffect(() => {
    setCookTime(recipeToUpdate?.cook_time || 0);
  }, [recipeToUpdate?.cook_time]);

  useEffect(() => {
    setCategories(recipeToUpdate?.categories?.map((category) => category.name) || []);
  }, [recipeToUpdate?.categories]);

  useEffect(() => {
    setImage(recipeToUpdate?.image || null);
  }, [recipeToUpdate?.image]);

  useEffect(() => {
    setDescription(recipeToUpdate?.description || '');
  }, [recipeToUpdate?.description]);

  useEffect(() => {
    const updatedIngredients = recipeToUpdate?.ingredients?.map((ingredient, index) => ({
      id: index,
      values: { ...ingredient },
    })) || [{ id: Date.now(), values: { measurement: '', quantity: '', name: '' } }];

    setIngredients(updatedIngredients);
  }, [recipeToUpdate?.ingredients]);

  const isMutating = isLoading || isPending;

  return (
    <Drawer
      opened={opened}
      onClose={handlers.close}
      title={recipeToUpdate ? 'Redigera recept' : 'Lägg till recept'}
    >
      <Stack gap="sm">
        <TextInput
          label="Namn på receptet"
          placeholder="Linsgryta"
          withAsterisk
          value={recipeName}
          onChange={(e) => {
            resetError('recipeName');
            setRecipeName(e.currentTarget.value);
          }}
          error={errors.recipeName}
        />
        <Select
          label="Antal portioner"
          placeholder={defaultServings.toString()}
          withAsterisk
          value={servings}
          data={Array.from({ length: 12 }, (_, index) => ((index + 1) * 2).toString())}
          onChange={setServings}
        />
        <NumberInput
          label="Tid för prep (i minuter)"
          placeholder="0"
          withAsterisk
          value={prep_time}
          onChange={setPrepTime}
        />
        <NumberInput
          label="Tid för tillagning (i minuter)"
          placeholder={defaultServings.toString()}
          withAsterisk
          value={cook_time}
          onChange={setCookTime}
        />
        <TagsInput
          label="Kategori"
          placeholder="Välj kategori"
          data={props.categories.map((a) => a.name)}
          value={categories}
          onChange={setCategories}
        />
        <Text c="red" size="xs">
          {errors.categories}
        </Text>
        <ImageUploader image={image} setImage={setImage} clearImage={clearImage} />
        <IngredientsFieldset
          ingredients={ingredients}
          handleAddComponent={handleAddComponent}
          handleRemoveComponent={handleRemoveComponent}
          handleChangeValue={handleChangeValue}
          errors={errors}
          addError={addError}
        />
        <Textarea
          placeholder="Beskrivning"
          styles={{
            input: {
              resize: 'vertical',
              height: '10rem',
            },
          }}
          withAsterisk
          value={description}
          onChange={(e) => {
            resetError('description');
            setDescription(e.currentTarget.value);
          }}
          error={errors.description}
        />
        <Button
          leftSection={<IconDeviceFloppy size={20} />}
          onClick={async (e) => {
            e.preventDefault();
            setIsLoading(true);

            const mappedIngredients = ingredients.map((ingredient) => ingredient.values);
            const validate = validateRecipe({
              recipeName,
              description,
              ingredients: mappedIngredients,
              categories,
            });

            setErrors(validate.errors);
            setIsLoading(false);

            if (validate.valid) {
              const recipe = {
                name: recipeName,
                servings: Number(servings),
                prep_time: Number(prep_time),
                cook_time: Number(cook_time),
                categories,
                description,
                image,
                ingredients: mappedIngredients,
              };
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
              setRecipeName('');
              setServings(defaultServings);
              setCategories([]);
              setDescription('');
              setImage('');
              setIngredients(initialIngredients);
            }
          }}
          loading={isMutating}
        >
          Spara
        </Button>
      </Stack>
    </Drawer>
  );
}
