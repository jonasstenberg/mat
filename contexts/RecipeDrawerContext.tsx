'use client';

import React, { useState } from 'react';
import { useDisclosure } from '@mantine/hooks';
import { RecipeProps } from '@/types/recipe';

interface RecipeDrawerContextType {
  opened: boolean;
  handlers: {
    open: () => void;
    close: () => void;
    toggle: () => void;
  };
  recipeToUpdate: RecipeProps | undefined | null;
  setRecipeToUpdate: (recipe: RecipeProps | undefined | null) => void;
}

export const RecipeDrawerContext = React.createContext<RecipeDrawerContextType | undefined>(
  undefined
);

interface RecipeDrawerProviderProps {
  children: React.ReactNode;
}

export const RecipeDrawerProvider = ({ children }: RecipeDrawerProviderProps) => {
  const [recipe, setRecipe] = useState<RecipeProps | undefined | null>(null);
  const [opened, handlers] = useDisclosure(false, {
    onClose: () => setRecipe(null),
  });

  return (
    <RecipeDrawerContext.Provider
      value={{ opened, handlers, recipeToUpdate: recipe, setRecipeToUpdate: setRecipe }}
    >
      {children}
    </RecipeDrawerContext.Provider>
  );
};
