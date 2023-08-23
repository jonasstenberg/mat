'use client';

import { DraggableProvided } from '@hello-pangea/dnd';
import { Center, CloseButton, Group, TextInput } from '@mantine/core';
import { IconGripVertical } from '@tabler/icons-react';
import { UseFormReturnType } from '@mantine/form';
import { IngredientSchema, RecipeSchema } from '@/types/recipe';
import DraggableFieldset from '@/components/DraggableFieldset';

type IngredientSectionProps = {
  ingredients: IngredientSchema[];
  form: UseFormReturnType<RecipeSchema>;
};

export const IngredientSection: React.FC<IngredientSectionProps> = ({ ingredients, form }) => {
  const renderIngredient = (
    ingredient: IngredientSchema,
    index: number,
    provided: DraggableProvided
  ) => (
    <Group
      grow
      preventGrowOverflow={false}
      wrap="nowrap"
      key={ingredient.id}
      ref={provided.innerRef}
      mb="md"
      {...provided.draggableProps}
    >
      <Center {...provided.dragHandleProps}>
        <IconGripVertical size={18} />
      </Center>
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
        withAsterisk
        {...form.getInputProps(`ingredients.${index}.name`)}
      />
      <CloseButton onClick={() => form.removeListItem('ingredients', index)} />
    </Group>
  );

  return (
    <DraggableFieldset<IngredientSchema>
      items={ingredients}
      renderItem={renderIngredient}
      onReorder={(from, to) => form.reorderListItem('ingredients', { from, to })}
      onAddItem={() =>
        form.insertListItem('ingredients', {
          id: Date.now(),
          measurement: '',
          quantity: '',
          name: '',
        })
      }
      legend="Ingredienser"
      error={form.errors.ingredients}
    />
  );
};
