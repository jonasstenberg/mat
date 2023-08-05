'use client';

import { Session } from 'next-auth';
import { SessionProvider } from 'next-auth/react';
import { ReactNode } from 'react';
import { RecipeDrawerProvider } from '@/contexts/RecipeDrawerContext';
import { LoginDrawerProvider } from '@/contexts/LoginDrawerContext';

interface Props {
  children: ReactNode;
  session: Session | null;
}

export default function Providers({ children, session }: Props) {
  return (
    <SessionProvider session={session}>
      <LoginDrawerProvider>
        <RecipeDrawerProvider>{children}</RecipeDrawerProvider>
      </LoginDrawerProvider>
    </SessionProvider>
  );
}
