import { NextAuthOptions } from 'next-auth'
import NextAuth from 'next-auth/next'
import CredentialsProvider from 'next-auth/providers/credentials'
import jwt from 'jsonwebtoken'

export const authOptions: NextAuthOptions = {
  session: {
    strategy: 'jwt'
  },
  providers: [
    CredentialsProvider({
      credentials: {
        email: { label: 'Email', type: 'email', placeholder: 'me@example.com' },
        password: { label: 'Password', type: 'password' }
      },
      authorize(credentials, req) {
        const { email, password } = credentials as {
          email: string
          password: string
        }

        if (email !== 'jonas@stenberg.io' || password !== 'asdf') {
          return null
        }

        return {
          id: '1234',
          name: 'Jonas',
          email
        }
      }
    })
  ],
  jwt: {
    maxAge: 60 * 60 * 24 * 30,
    encode: async ({ secret, token, maxAge }) => {
      const tokenContent = {
        name: token?.name,
        email: token?.email,
        sub: token?.sub
      }
      const encodedToken = jwt.sign(tokenContent, secret, { algorithm: 'HS256' })

      return encodedToken
    },
    decode: async ({ secret, token }) => {
      // @ts-ignore-next-line
      const verify = jwt.verify(token, secret)
      return verify
    }
  }
}

const handler = NextAuth(authOptions)

export { handler as GET, handler as POST }
