import { z } from 'zod';
import { isValidPassword } from '@/utils/validatePassword';

export const signInSchema = z.object({
  email: z.string().email(),
  password: z.string().min(8, { message: 'Lösenordet måste vara minst 8 bokstäver långt ' }),
});

export type SignInSchema = z.infer<typeof signInSchema>;

export const signUpSchemaProvider = z.object({
  email: z.string().email(),
  name: z.string().min(2, { message: 'Namnet måste vara minst 2 bokstäver långt' }),
  provider: z.string(),
});

export type SignUpSchemaProvider = z.infer<typeof signUpSchemaProvider>;

export const signUpSchema = z.object({
  email: z.string().email(),
  name: z.string().min(2, { message: 'Namnet måste vara minst 2 bokstäver långt' }),
  password: z
    .string()
    .min(8, { message: 'Lösenordet måste vara minst 8 bokstäver långt ' })
    .optional(),
});

export type SignUpSchema = z.infer<typeof signUpSchema>;

export const passwordChangeSchema = z
  .object({
    email: z.string().email(),
    oldPassword: z.string().min(8, { message: 'Lösenordet måste vara minst 8 bokstäver långt ' }),
    password: z.string().min(8, { message: 'Lösenordet måste vara minst 8 bokstäver långt ' }),
    confirmPassword: z.string(),
  })
  .refine((data) => data.password === data.confirmPassword, {
    message: 'Lösenorden måste matcha varandra',
    path: ['confirmPassword'],
  })
  .refine((data) => isValidPassword(data.password), {
    message:
      'Lösenordet måste innehålla minst 8 tecken, minst en stor bokstav, minst en liten bokstav och minst en siffra.',
    path: ['password'],
  });

export type PasswordChangeSchema = z.infer<typeof passwordChangeSchema>;

export const userProfileSchema = z.object({
  email: z.string().email(),
  name: z.string().min(2, { message: 'Namnet måste vara minst 2 bokstäver långt' }),
  measures_system: z.enum(['metric', 'imperial']),
});

export type UserProfileSchema = z.infer<typeof userProfileSchema>;

export const userSchema = userProfileSchema.extend({
  id: z.string().uuid().optional(),
  provider: z.string().optional(),
});

export type UserSchema = z.infer<typeof userSchema>;
