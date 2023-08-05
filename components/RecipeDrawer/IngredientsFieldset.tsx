import React from 'react';
import { Button, CloseButton, Text, Group, Stack, Fieldset } from '@mantine/core';

import Ingredient from './Ingredient';

interface IngredientsFieldsetProps {
  ingredients: any[];
  handleAddComponent: () => void;
  handleRemoveComponent: (id: number) => void;
  handleChangeValue: (id: number, name: string, value: string) => void;
  addError: boolean;
  errors: { ingredients?: string };
}

const IngredientsFieldset: React.FC<IngredientsFieldsetProps> = ({
  ingredients,
  handleAddComponent,
  handleRemoveComponent,
  handleChangeValue,
  addError,
  errors,
}) => (
  <Fieldset legend="Ingredienser">
    <Stack gap="sm">
      {ingredients.map((ingredient) => (
        <Group grow preventGrowOverflow={false} wrap="nowrap" key={ingredient.id}>
          <React.Fragment key={ingredient.id}>
            <Ingredient
              values={ingredient.values}
              onChange={(name, value) => handleChangeValue(ingredient.id, name, value)}
            />
          </React.Fragment>
          <CloseButton onClick={() => handleRemoveComponent(ingredient.id)} />
        </Group>
      ))}
      {errors.ingredients && (
        <Text c="red" size="xs">
          {errors.ingredients}
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
