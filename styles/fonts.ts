import { Open_Sans, Azeret_Mono, Lora } from 'next/font/google'

export const openSans = Open_Sans({
  weight: ['400', '600'],
  subsets: ['latin'],
  display: 'swap',
  variable: '--font-open-sans'
})

export const azeretMono = Azeret_Mono({
  weight: ['400', '600'],
  subsets: ['latin'],
  display: 'swap',
  variable: '--font-azeret-mono'
})

export const lora = Lora({
  weight: ['400', '600'],
  subsets: ['latin'],
  display: 'swap',
  variable: '--font-lora'
})
