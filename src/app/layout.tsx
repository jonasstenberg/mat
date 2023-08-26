import '@mantine/core/styles.css';
import '@mantine/notifications/styles.css';
import Link from 'next/link';
import { getServerSession } from 'next-auth';
import clsx from 'clsx';
import { MantineProvider } from '@mantine/core';
import dynamic from 'next/dynamic';
import { Notifications } from '@mantine/notifications';

import '@/styles/globals.css';
import styles from '@/app/page.module.css';
import { azeretMono, openSans, lora, finlandica } from '@/styles/fonts';

import { getCategories } from '@/lib/categories';
import { authOptions } from '@/app/api/auth/[...nextauth]/route';
import Providers from '@/components/Providers';
import { theme } from '@/theme';
import Navbar from '@/components/Navbar';

const RecipeModal = dynamic(() => import('@/components/Modals/Recipe/RecipeModal'), {
  loading: () => <p />,
  ssr: false,
});

const AuthModal = dynamic(() => import('@/components/Modals/Auth/AuthModal'), {
  loading: () => <p />,
  ssr: false,
});

const SettingsModal = dynamic(() => import('@/components/Modals/Settings/SettingsModal'), {
  loading: () => <p />,
  ssr: false,
});

export const metadata = {
  generator: 'Next.js',
  title: 'Stenbergs receptlåda',
  description: 'En receptsida med recept värda att laga mer än en gång',
  authors: [{ name: 'Jonas Stenberg', url: 'https://www.stenberg.io' }],
  creator: 'Jonas Stenberg',
  publisher: 'Jonas Stenberg',
  keywords: ['recept', 'stenberg', 'mat'],
  metadataBase: new URL('https://mat.stenberg.io'),
  openGraph: {
    title: 'Stenbergs receptlåda',
    description: 'En receptsida med recept värda att laga mer än en gång',
    url: 'https://mat.stenberg.io',
    siteName: 'Stenbergs receptlåda',
    locale: 'sv_SE',
    type: 'website',
  },
  viewport: 'width=device-width, initial-scale=1, maximum-scale=1',
};

export default async function RootLayout({ children }: { children: React.ReactNode }) {
  const categories = await getCategories();
  const session = await getServerSession(authOptions);

  return (
    <html
      lang="sv"
      className={clsx(openSans.variable, azeretMono.variable, lora.variable, finlandica.variable)}
    >
      <head />
      <Providers session={session}>
        <body>
          <MantineProvider theme={theme} defaultColorScheme="light">
            <Notifications position="top-right" />
            <AuthModal />
            {session?.user?.email && <SettingsModal session={session} />}
            {session?.user?.email && <RecipeModal categories={categories} />}
            <header className={styles.header}>
              <h1 className={styles['header-heading']}>
                <Link href="/">stenberg&apos;s receptsida</Link>
              </h1>
              <Navbar session={session} />
            </header>
            {children}
          </MantineProvider>
        </body>
      </Providers>
    </html>
  );
}
