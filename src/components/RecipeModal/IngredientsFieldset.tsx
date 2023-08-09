import React from 'react';
import { Button, CloseButton, Text, Group, Stack, Fieldset } from '@mantine/core';

import Ingredient from './Ingredient';
import { IngredientProps } from '@/types/recipe';

interface IngredientsFieldsetProps {
  ingredients: IngredientProps[];
  handleAddComponent: () => void;
  handleRemoveComponent: (id: string | number) => void;
  handleChangeValue: (id: string | number, name: string, value: string) => void;
  addError: boolean;
  error: string | undefined;
}

const IngredientsFieldset: React.FC<IngredientsFieldsetProps> = ({
  ingredients,
  handleAddComponent,
  handleRemoveComponent,
  handleChangeValue,
  addError,
  error,
}) => (
  <Fieldset legend="Ingredienser">
    <Stack gap="sm">
      {ingredients?.map((ingredient) => (
        <Group grow preventGrowOverflow={false} wrap="nowrap" key={ingredient.id}>
          <React.Fragment key={ingredient.id}>
            <Ingredient
              ingredient={ingredient}
              onChange={(name, value) => handleChangeValue(ingredient.id, name, value)}
            />
          </React.Fragment>
          <CloseButton onClick={() => handleRemoveComponent(ingredient.id)} />
        </Group>
      ))}
      {error && (
        <Text c="red" size="xs">
          {error}
        </Text>
      )}
      <Button
        onClick={(e) => {
          e.preventDefault();
          handleAddComponent();
        }}
        disabled={addError}
      >
        Lägg till ingrediens
      </Button>
    </Stack>
  </Fieldset>
);

export default IngredientsFieldset;
