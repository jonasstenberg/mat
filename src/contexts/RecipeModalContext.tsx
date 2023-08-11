'use client';

import React, { useState } from 'react';
import { useDisclosure } from '@mantine/hooks';
import { RecipeProps } from '@/types/recipe';

const defaultServings = process.env.NEXT_PUBLIC_DEFAULT_SERVINGS || '4';
const defaultServingsName = process.env.NEXT_PUBLIC_DEFAULT_SERVINGS_NAME || 'portioner';

const defaultRecipeFormData = {
  name: '',
  categories: [],
  servings: Number(defaultServings),
  servings_name: defaultServingsName,
  prep_time: 0,
  cook_time: 0,
  ingredients: [{ id: Date.now(), measurement: '', quantity: '', name: '' }],
  description: '',
  image: '',
};

interface RecipeModalContextType {
  opened: boolean;
  handlers: {
    open: () => void;
    close: () => void;
    toggle: () => void;
  };
  recipeFormData: RecipeProps;
  setRecipeFormData: React.Dispatch<React.SetStateAction<RecipeProps>>;
  recipeToUpdate: RecipeProps | undefined | null;
  setRecipeToUpdate: React.Dispatch<React.SetStateAction<RecipeProps | undefined | null>>;
}

export const RecipeModalContext = React.createContext<RecipeModalContextType | undefined>(
  undefined
);

interface RecipeModalProviderProps {
  children: React.ReactNode;
}

export const RecipeModalProvider = ({ children }: RecipeModalProviderProps) => {
  const [recipeToUpdate, setRecipeToUpdate] = useState<RecipeProps | undefined | null>(null);
  const [recipeFormData, setRecipeFormData] = useState<RecipeProps>(defaultRecipeFormData);
  const [opened, handlers] = useDisclosure(false, {
    onClose: () => {
      setRecipeToUpdate(null);
      setRecipeFormData(defaultRecipeFormData);
    },
  });

  return (
    <RecipeModalContext.Provider
      value={{
        opened,
        handlers,
        recipeFormData,
        setRecipeFormData,
        recipeToUpdate,
        setRecipeToUpdate,
      }}
    >
      {children}
    </RecipeModalContext.Provider>
  );
};
