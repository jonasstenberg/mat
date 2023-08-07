'use client';

import { useContext } from 'react';

import { LoginDrawerContext } from '@/contexts/LoginDrawerContext';

export const useLoginDrawer = () => {
  const context = useContext(LoginDrawerContext);
  if (!context) {
    throw new Error('hook must be used within its provider');
  }
  return context;
};
