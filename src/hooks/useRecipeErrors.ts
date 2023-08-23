'use client';

import { useContext } from 'react';

import { ErrorContext } from '@/contexts/ErrorContext';

export const useErrors = () => {
  const context = useContext(ErrorContext);
  if (!context) {
    throw new Error('hook must be used within its provider');
  }
  return context;
};
