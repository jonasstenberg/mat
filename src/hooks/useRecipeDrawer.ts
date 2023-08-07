'use client';

import { useContext } from 'react';

import { RecipeDrawerContext } from '@/contexts/RecipeDrawerContext';

export const useRecipeDrawer = () => {
  const context = useContext(RecipeDrawerContext);
  if (!context) {
    throw new Error('hook must be used within its provider');
  }
  return context;
};
