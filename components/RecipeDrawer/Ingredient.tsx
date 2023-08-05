'use client';

import { TextInput } from '@mantine/core';
import React from 'react';

interface IngredientProps {
  values: { measurement: string; quantity: string; name: string };
  onChange: (name: string, value: string) => void;
}

const Ingredient = ({ values, onChange }: IngredientProps) => (
  <>
    <TextInput
      value={values.quantity}
      placeholder="2"
      w="4rem"
      onChange={(e) => onChange('quantity', e.target.value)}
      autoCapitalize="none"
    />
    <TextInput
      value={values.measurement}
      placeholder="dl"
      w="4rem"
      onChange={(e) => onChange('measurement', e.target.value)}
      autoCapitalize="none"
    />
    <TextInput
      value={values.name}
      placeholder="vatten"
      onChange={(e) => onChange('name', e.target.value)}
      autoCapitalize="none"
    />
  </>
);

export default Ingredient;
