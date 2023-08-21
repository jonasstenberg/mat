import {
  Box,
  Button,
  CloseButton,
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
import React from 'react';
import { useForm, zodResolver } from '@mantine/form';
import { useRouter } from 'next/navigation';
import { useRecipeModal } from '@/hooks/useRecipeModal';
import { saveRecipe, updateRecipe } from '@/actions/recipe';
import { IngredientSchema, RecipeSchema, recipeSchema } from '@/types/recipe';

const defaultServings = process.env.NEXT_PUBLIC_DEFAULT_SERVINGS || '4';
const defaultServingsName = process.env.NEXT_PUBLIC_DEFAULT_SERVINGS_NAME || 'portioner';

type RecipeFormProps = {
  categories: string[];
};

export default function RecipeForm({ categories }: RecipeFormProps) {
  const { handlers, recipeToUpdate } = useRecipeModal();
  const router = useRouter();

  const initialIngredient: IngredientSchema = {
    id: Date.now(),
    measurement: '',
    quantity: '',
    name: '',
  };

  const form = useForm<RecipeSchema>({
    validate: zodResolver(recipeSchema),
    initialValues: recipeToUpdate ?? {
      name: '',
      categories: [],
      servings: Number(defaultServings),
      servings_name: defaultServingsName,
      prep_time: 0,
      cook_time: 0,
      ingredients: [initialIngredient],
      description: '',
      image: '',
    },
    transformValues: (values: RecipeSchema) => ({
      ...values,
      prep_time: Number(values.prep_time) || 0,
      cook_time: Number(values.cook_time) || 0,
    }),
  });

  return (
    <Box
      component="form"
      onSubmit={form.onSubmit(async () => {
        const formData = new FormData();

        const recipe: RecipeSchema = form.getTransformedValues();

        Object.keys(recipe).forEach((key) => {
          const value = recipe[key as keyof RecipeSchema];
          if (value !== null && value !== undefined) {
            switch (typeof value) {
              case 'string':
              case 'number':
                formData.append(key, value.toString());
                break;
              case 'object':
                if (value instanceof File) {
                  formData.append(key, value);
                } else if (Array.isArray(value)) {
                  formData.append(key, JSON.stringify(value));
                }
                break;
            }
          }
        });

        if (recipeToUpdate) {
          await updateRecipe(recipeToUpdate.id as string, formData);
          handlers.close();
          router.refresh();
        } else {
          const id = await saveRecipe(formData);
          handlers.close();
          router.push(`/recipe/${id}`);
        }
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
              placeholder={defaultServings.toString()}
              w="15%"
              miw="7rem"
              withAsterisk
              data={Array.from({ length: 12 }, (_, index) => ((index + 1) * 2).toString())}
              {...form.getInputProps('servings')}
            />
            <TextInput
              label="Enhet"
              placeholder="Portioner"
              w="85%"
              withAsterisk
              {...form.getInputProps('servings_name')}
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
              {...form.getInputProps('prep_time')}
            />
            <NumberInput
              label="Tillagning"
              placeholder=""
              w="50%"
              withAsterisk
              {...form.getInputProps('cook_time')}
            />
          </Group>
        </Fieldset>
        <Fieldset legend="Bilduppladdning">
          <Stack>
            <Group grow>
              <FileButton name="image" accept="image/*" {...form.getInputProps('image')}>
                {(props) => <Button {...props}>Ladda upp bild</Button>}
              </FileButton>
              <Button
                disabled={!form.values.image}
                color="red"
                onClick={() =>
                  form.setValues({
                    image: null,
                  })
                }
              >
                Ta bort
              </Button>
            </Group>
            {form.values.image && (
              <Image
                h={200}
                w="auto"
                fit="cover"
                src={
                  typeof form.values.image === 'string'
                    ? `/api/image?filename=${form.values.image}`
                    : URL.createObjectURL(form.values.image)
                }
                alt="Förhandsgranskning"
              />
            )}
          </Stack>
        </Fieldset>
        <Fieldset legend="Ingredienser">
          <Stack gap="sm">
            {form.values.ingredients?.map((ingredient, index) => (
              <Group grow preventGrowOverflow={false} wrap="nowrap" key={ingredient.id}>
                <React.Fragment key={ingredient.id}>
                  <TextInput
                    placeholder="2"
                    w="15%"
                    miw="3rem"
                    autoCapitalize="none"
                    {...form.getInputProps(`ingredients.${index}.quantity`)}
                  />
                  <TextInput
                    placeholder="dl"
                    w="15%"
                    miw="3rem"
                    autoCapitalize="none"
                    {...form.getInputProps(`ingredients.${index}.measurement`)}
                  />
                  <TextInput
                    placeholder="vatten"
                    w="70%"
                    miw="5rem"
                    autoCapitalize="none"
                    {...form.getInputProps(`ingredients.${index}.name`)}
                  />
                </React.Fragment>
                <CloseButton onClick={() => form.removeListItem('ingredients', index)} />
              </Group>
            ))}
            <Button onClick={() => form.insertListItem('ingredients', initialIngredient)}>
              Lägg till ingrediens
            </Button>
          </Stack>
        </Fieldset>
        <Textarea
          name="description"
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
        <Button leftSection={<IconDeviceFloppy size={20} />} type="submit">
          Spara
        </Button>
      </Stack>
    </Box>
  );
}
