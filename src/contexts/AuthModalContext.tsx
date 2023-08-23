'use client';

import React, { useState } from 'react';
import { useDisclosure } from '@mantine/hooks';
import { UserSchema } from '@/types/user';

type AuthModalContextType = {
  opened: boolean;
  handlers: {
    open: () => void;
    close: () => void;
    toggle: () => void;
  };
  user: UserSchema | null;
  setUser: React.Dispatch<React.SetStateAction<UserSchema | null>>;
};

export const AuthModalContext = React.createContext<AuthModalContextType | undefined>(undefined);

type AuthModalProviderProps = {
  children: React.ReactNode;
};

export const AuthModalProvider = ({ children }: AuthModalProviderProps) => {
  const [user, setUser] = useState<AuthModalContextType['user']>(null);
  const [opened, handlers] = useDisclosure(false);

  return (
    <AuthModalContext.Provider value={{ opened, handlers, user, setUser }}>
      {children}
    </AuthModalContext.Provider>
  );
};
