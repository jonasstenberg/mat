'use client';

import { useContext } from 'react';

import { SettingsModalContext } from '@/contexts/SettingsModalContext';

export const useSettingsModal = () => {
  const context = useContext(SettingsModalContext);
  if (!context) {
    throw new Error('hook must be used within its provider');
  }
  return context;
};
