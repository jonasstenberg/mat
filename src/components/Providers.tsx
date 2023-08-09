'use client';

import { Session } from 'next-auth';
import { SessionProvider } from 'next-auth/react';
import { ReactNode } from 'react';
import { RecipeModalProvider } from '@/contexts/RecipeModalContext';
import { LoginDrawerProvider } from '@/contexts/LoginDrawerContext';
import { ErrorProvider } from '@/contexts/ErrorContext';

interface Props {
  children: ReactNode;
  session: Session | null;
}

export default function Providers({ children, session }: Props) {
  return (
    <SessionProvider session={session}>
      <LoginDrawerProvider>
        <RecipeModalProvider>
          <ErrorProvider>{children}</ErrorProvider>
        </RecipeModalProvider>
      </LoginDrawerProvider>
    </SessionProvider>
  );
}
