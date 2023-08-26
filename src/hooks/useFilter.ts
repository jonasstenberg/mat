'use client';

import { useContext } from 'react';

import { FilterContext } from '@/contexts/FilterContext';

export const useFilter = () => {
  const context = useContext(FilterContext);
  if (!context) {
    throw new Error('hook must be used within its provider');
  }
  return context;
};
