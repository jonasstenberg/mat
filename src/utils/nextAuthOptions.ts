import { NextAuthOptions } from 'next-auth';
import CredentialsProvider from 'next-auth/providers/credentials';
import GoogleProvider from 'next-auth/providers/google';
import jwt from 'jsonwebtoken';

import { config } from '@/utils/config';
import { signUp } from '@/actions/user';

export const authOptions: NextAuthOptions = {
  session: {
    strategy: 'jwt',
  },
  providers: [
    GoogleProvider({
      clientId: config.googleClientId,
      clientSecret: config.googleSecret,
    }),
    CredentialsProvider({
      credentials: {
        email: { label: 'Email', type: 'email', placeholder: 'me@example.com' },
        password: { label: 'Password', type: 'password' },
      },
      authorize: async (credentials) => {
        const { email, password } = credentials as {
          email: string;
          password: string;
        };

        try {
          const response = await fetch(`${config.apiEndpoint}/rpc/login`, {
            method: 'POST',
            headers: {
              'Content-Type': 'application/json',
            },
            body: JSON.stringify({
              login_email: email,
              login_password: password,
            }),
          });

          if (!response.ok) {
            return null;
          }

          const user = await response.json();

          if (user) {
            return {
              id: user.id,
              name: user.name,
              email: user.email,
            };
          }
        } catch (error) {
          console.error(error);
        }

        return null;
      },
    }),
  ],
  jwt: {
    maxAge: 60 * 60 * 24 * 30,
    encode: async ({ secret, token, maxAge }) => {
      const tokenContent = {
        name: token?.name,
        email: token?.email,
        sub: token?.sub,
      };

      const encodedToken = jwt.sign(tokenContent, secret, {
        algorithm: 'HS256',
        expiresIn: maxAge,
      });

      return encodedToken;
    },
    decode: async ({ secret, token }) => {
      // @ts-ignore-next-line
      const verify = jwt.verify(token, secret);
      return verify;
    },
  },
  events: {
    async signIn({ profile, account }) {
      if (account?.provider === 'credentials') {
        return;
      }

      if (!profile?.name || !profile.email || !account?.provider) {
        return;
      }

      await signUp(profile.name, profile.email, account.provider);
    },
  },
};
