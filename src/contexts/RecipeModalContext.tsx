'use client';

import React, { useState } from 'react';
import { useDisclosure } from '@mantine/hooks';
import { RecipeSchema } from '@/types/recipe';

type RecipeModalContextType = {
  opened: boolean;
  handlers: {
    open: () => void;
    close: () => void;
    toggle: () => void;
  };
  recipeToUpdate: RecipeSchema | undefined | null;
  setRecipeToUpdate: React.Dispatch<React.SetStateAction<RecipeSchema | undefined | null>>;
};

export const RecipeModalContext = React.createContext<RecipeModalContextType | undefined>(
  undefined
);

type RecipeModalProviderProps = {
  children: React.ReactNode;
};

export const RecipeModalProvider = ({ children }: RecipeModalProviderProps) => {
  const [recipeToUpdate, setRecipeToUpdate] = useState<RecipeSchema | undefined | null>(null);
  const [opened, handlers] = useDisclosure(false, {
    onClose: () => {
      setRecipeToUpdate(null);
    },
  });

  return (
    <RecipeModalContext.Provider
      value={{
        opened,
        handlers,
        recipeToUpdate,
        setRecipeToUpdate,
      }}
    >
      {children}
    </RecipeModalContext.Provider>
  );
};
