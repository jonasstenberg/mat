'use client';

import React, { useState } from 'react';
import { useDisclosure } from '@mantine/hooks';
import { UserProps } from '@/types/user';

interface AuthModalContextType {
  opened: boolean;
  handlers: {
    open: () => void;
    close: () => void;
    toggle: () => void;
  };
  user: UserProps | null;
  setUser: React.Dispatch<React.SetStateAction<UserProps | null>>;
}

export const AuthModalContext = React.createContext<AuthModalContextType | undefined>(undefined);

interface AuthModalProviderProps {
  children: React.ReactNode;
}

export const AuthModalProvider = ({ children }: AuthModalProviderProps) => {
  const [user, setUser] = useState<AuthModalContextType['user']>(null);
  const [opened, handlers] = useDisclosure(false);

  return (
    <AuthModalContext.Provider value={{ opened, handlers, user, setUser }}>
      {children}
    </AuthModalContext.Provider>
  );
};
