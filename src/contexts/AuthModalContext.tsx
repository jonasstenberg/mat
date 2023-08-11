'use client';

import React from 'react';
import { useDisclosure } from '@mantine/hooks';

interface AuthModalContextType {
  opened: boolean;
  handlers: {
    open: () => void;
    close: () => void;
    toggle: () => void;
  };
}

export const AuthModalContext = React.createContext<AuthModalContextType | undefined>(undefined);

interface AuthModalProviderProps {
  children: React.ReactNode;
}

export const AuthModalProvider = ({ children }: AuthModalProviderProps) => {
  const [opened, handlers] = useDisclosure(false);

  return (
    <AuthModalContext.Provider value={{ opened, handlers }}>{children}</AuthModalContext.Provider>
  );
};
