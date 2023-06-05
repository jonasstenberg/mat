import Providers from '../components/Providers'

import './globals.css'
import { openSans } from '@/fonts'

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

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="sv" className={openSans.className}>
      <head />
      <Providers>
        <body>{children}</body>
      </Providers>
    </html>
  )
}
