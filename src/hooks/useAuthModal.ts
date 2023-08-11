'use client';

import { useContext } from 'react';

import { AuthModalContext } from '@/contexts/AuthModalContext';

export const useAuthModal = () => {
  const context = useContext(AuthModalContext);
  if (!context) {
    throw new Error('hook must be used within its provider');
  }
  return context;
};
