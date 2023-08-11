'use client';

import { TextInput } from '@mantine/core';
import React from 'react';
import { IngredientProps } from '@/types/recipe';

const Ingredient = ({
  ingredient,
  onChange,
}: {
  ingredient: IngredientProps;
  onChange: (name: string, value: string) => void;
}) => (
  <>
    <TextInput
      value={ingredient.quantity}
      placeholder="2"
      w="15%"
      miw="3rem"
      onChange={(e) => onChange('quantity', e.target.value)}
      autoCapitalize="none"
    />
    <TextInput
      value={ingredient.measurement}
      placeholder="dl"
      w="15%"
      miw="3rem"
      onChange={(e) => onChange('measurement', e.target.value)}
      autoCapitalize="none"
    />
    <TextInput
      value={ingredient.name}
      placeholder="vatten"
      w="70%"
      miw="5rem"
      onChange={(e) => onChange('name', e.target.value)}
      autoCapitalize="none"
    />
  </>
);

export default Ingredient;
