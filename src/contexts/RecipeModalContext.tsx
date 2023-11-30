'use client';

import React, { useState } from 'react';
import { useDisclosure } from '@mantine/hooks';
import { UseFormReturnType } from '@mantine/form';
import { RecipeSchema } from '@/types/recipe';

type RecipeModalContextType = {
  opened: boolean;
  handlers: {
    open: () => void;
    close: () => void;
    toggle: () => void;
  };
  formRecipe: RecipeSchema | undefined | null;
  setFormRecipe: React.Dispatch<React.SetStateAction<RecipeSchema | undefined | null>>;
  form: UseFormReturnType<RecipeSchema> | null;
  setForm: (form: UseFormReturnType<RecipeSchema>) => void;
};

export const RecipeModalContext = React.createContext<RecipeModalContextType | undefined>(
  undefined
);

type RecipeModalProviderProps = {
  children: React.ReactNode;
};

export const RecipeModalProvider = ({ children }: RecipeModalProviderProps) => {
  const [formRecipe, setFormRecipe] = useState<RecipeSchema | undefined | null>(null);
  const [form, setForm] = useState<UseFormReturnType<RecipeSchema> | null>(null);
  const [opened, handlers] = useDisclosure(false, {
    onClose: () => {
      setFormRecipe(null);
    },
  });

  return (
    <RecipeModalContext.Provider
      value={{
        opened,
        handlers,
        formRecipe,
        setFormRecipe,
        form,
        setForm,
      }}
    >
      {children}
    </RecipeModalContext.Provider>
  );
};
