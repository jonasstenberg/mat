'use client';

import React from 'react';
import { useDisclosure } from '@mantine/hooks';

interface LoginDrawerContextType {
  opened: boolean;
  handlers: {
    open: () => void;
    close: () => void;
    toggle: () => void;
  };
}

export const LoginDrawerContext = React.createContext<LoginDrawerContextType | undefined>(
  undefined
);

interface LoginDrawerProviderProps {
  children: React.ReactNode;
}

export const LoginDrawerProvider = ({ children }: LoginDrawerProviderProps) => {
  const [opened, handlers] = useDisclosure(false);

  return (
    <LoginDrawerContext.Provider value={{ opened, handlers }}>
      {children}
    </LoginDrawerContext.Provider>
  );
};
