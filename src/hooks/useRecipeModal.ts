'use client';

import { useContext } from 'react';

import { RecipeModalContext } from '@/contexts/RecipeModalContext';

export const useRecipeModal = () => {
  const context = useContext(RecipeModalContext);
  if (!context) {
    throw new Error('hook must be used within its provider');
  }
  return context;
};
