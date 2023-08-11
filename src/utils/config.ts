import { z } from 'zod';
import dotenv from 'dotenv';

dotenv.config();

const Config = z
  .object({
    secret: z.string().min(30),
    authUrl: z.string().url(),
    baseUrl: z.string().url(),
    apiEndpoint: z.string().url(),
    defaultServings: z.number(),
    googleClientId: z.string().min(10),
    googleSecret: z.string().min(10),
  })
  .strict();

export type Config = z.infer<typeof Config>;

export const config = Config.parse({
  secret: process.env.NEXTAUTH_SECRET,
  authUrl: process.env.NEXTAUTH_URL,
  baseUrl: process.env.NEXT_PUBLIC_BASE_URL,
  apiEndpoint: process.env.NEXT_PUBLIC_API_ENDPOINT,
  defaultServings: parseInt(process.env.NEXT_PUBLIC_DEFAULT_SERVINGS || '', 10),
  googleClientId: process.env.GOOGLE_CLIENT_ID,
  googleSecret: process.env.GOOGLE_SECRET,
});
