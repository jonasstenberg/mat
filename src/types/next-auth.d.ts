import { DefaultSession } from 'next-auth';

declare module 'next-auth' {
  type Session = {
    user: {
      id: string;
    } & DefaultSession['user'];
  };
}
