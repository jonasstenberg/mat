'use client';

import { Session } from 'next-auth';
import { SessionProvider } from 'next-auth/react';
import { ReactNode } from 'react';
import { RecipeModalProvider } from '@/contexts/RecipeModalContext';
import { AuthModalProvider } from '@/contexts/AuthModalContext';
import { SettingsModalProvider } from '@/contexts/SettingsModalContext';
import { FilterProvider } from '@/contexts/FilterContext';

type ProviderProps = {
  children: ReactNode;
  session: Session | null;
};

export default function Providers({ children, session }: ProviderProps) {
  return (
    <SessionProvider session={session}>
      <SettingsModalProvider>
        <AuthModalProvider>
          <RecipeModalProvider>
            <FilterProvider>{children}</FilterProvider>
          </RecipeModalProvider>
        </AuthModalProvider>
      </SettingsModalProvider>
    </SessionProvider>
  );
}
