import Link from 'next/link'
import { getServerSession } from 'next-auth'
import LoginButton from '@/components/LoginButton'

import { authOptions } from '@/app/api/auth/[...nextauth]/route'
import Providers from '@/components/Providers'

import '@/styles/globals.css'
import styles from './page.module.css'
import { azeretMono, openSans, lora } from '@/styles/fonts'
import clsx from 'clsx'

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
    type: 'website'
  }
}

export default async function RootLayout({ children }: { children: React.ReactNode }) {
  const session = await getServerSession(authOptions)

  return (
    <html lang="sv" className={clsx(openSans.variable, azeretMono.variable, lora.variable)}>
      <head />
      <Providers session={session}>
        <body>
          <header className={styles.header}>
            <h1 className={styles['header-heading']}>
              <Link href="/">stenberg&apos;s receptsida</Link>
            </h1>
            <LoginButton />
          </header>
          {children}
        </body>
      </Providers>
    </html>
  )
}
