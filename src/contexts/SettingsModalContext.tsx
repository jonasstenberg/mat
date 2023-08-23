'use client';

import React from 'react';
import { useDisclosure } from '@mantine/hooks';

type SettingsModalContextType = {
  opened: boolean;
  handlers: {
    open: () => void;
    close: () => void;
    toggle: () => void;
  };
};

export const SettingsModalContext = React.createContext<SettingsModalContextType | undefined>(
  undefined
);

type SettingsModalProviderProps = {
  children: React.ReactNode;
};

export const SettingsModalProvider = ({ children }: SettingsModalProviderProps) => {
  const [opened, handlers] = useDisclosure(false);

  return (
    <SettingsModalContext.Provider value={{ opened, handlers }}>
      {children}
    </SettingsModalContext.Provider>
  );
};
