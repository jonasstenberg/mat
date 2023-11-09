import { z } from 'zod';
import dotenv from 'dotenv';

dotenv.config();

const Config = z
  .object({
    isProduction: z.boolean(),
    secret: z.string().min(30),
    authUrl: z.string().url(),
    baseUrl: z.string().url(),
    apiEndpoint: z.string().url(),
    defaultRecipeYield: z.number(),
    defaultRecipeYieldName: z.string(),
    googleClientId: z.string().min(10),
    googleSecret: z.string().min(10),
    categoryIfNonExist: z.string(),
    cookieSecurePrefix: z.string().optional(),
    openaiApiKey: z.string(),
  })
  .strict();

export type Config = z.infer<typeof Config>;

export const config = Config.parse({
  isProduction: process.env.NODE_ENV === 'production',
  secret: process.env.NEXTAUTH_SECRET,
  authUrl: process.env.NEXTAUTH_URL,
  baseUrl: process.env.NEXT_PUBLIC_BASE_URL,
  apiEndpoint: process.env.NEXT_PUBLIC_API_ENDPOINT,
  defaultRecipeYield: parseInt(process.env.NEXT_PUBLIC_DEFAULT_RECIPE_YIELD || '', 10),
  defaultRecipeYieldName: process.env.NEXT_PUBLIC_DEFAULT_RECIPE_YIELD_NAME || '',
  googleClientId: process.env.GOOGLE_CLIENT_ID,
  googleSecret: process.env.GOOGLE_SECRET,
  categoryIfNonExist: process.env.CATEGORY_IF_NON_EXIST,
  cookieSecurePrefix: process.env.COOKIE_SECURE_PREFIX,
  openaiApiKey: process.env.OPENAI_API_KEY,
});

export const nextPublicEnvironments = {
  defaultRecipeYield: process.env.NEXT_PUBLIC_DEFAULT_RECIPE_YIELD || '4',
  defaultRecipeYieldName: process.env.NEXT_PUBLIC_DEFAULT_RECIPE_YIELD_NAME || 'portioner',
};
