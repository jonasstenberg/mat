import { validateSchema } from '@/utils/validateSchema'; // Update with the correct import path
import { signInSchema, passwordChangeSchema, signUpSchema } from '@/types/user';

describe('Zod schemas', () => {
  describe('signInSchema', () => {
    it('validates correct signIn data', () => {
      const data = {
        email: 'john@example.com',
        password: 'Password123',
      };
      const result = validateSchema(signInSchema, data);
      expect(result.success).toBe(true);
      expect(result.data).toEqual(data);
    });

    it('returns error for incorrect signIn data', () => {
      const data = {
        email: 'invalid-email',
        password: 'short',
      };
      const result = validateSchema(signInSchema, data);
      expect(result.success).toBe(false);
      expect(result.errors).toEqual({
        email: 'Invalid email',
        password: 'Lösenordet måste vara minst 8 bokstäver långt ',
      });
    });
  });

  describe('signUpSchema', () => {
    it('validates correct signUp data', () => {
      const data = {
        email: 'john@example.com',
        password: 'Password123',
        name: 'John Doe',
      };
      const result = validateSchema(signUpSchema, data);
      expect(result.success).toBe(true);
      expect(result.data).toEqual(data);
    });
  });

  describe('passwordChangeSchema', () => {
    it('validates correct passwordChange data', () => {
      const data = {
        email: 'john@example.com',
        oldPassword: 'OldPassword123',
        password: 'NewPassword123',
        confirmPassword: 'NewPassword123',
      };
      const result = validateSchema(passwordChangeSchema, data);
      expect(result.success).toBe(true);
      expect(result.data).toEqual(data);
    });

    it('returns error when passwords do not match', () => {
      const data = {
        email: 'john@example.com',
        oldPassword: 'OldPassword123',
        password: 'NewPassword123',
        confirmPassword: 'DifferentPassword123',
      };
      const result = validateSchema(passwordChangeSchema, data);
      expect(result.success).toBe(false);
      expect(result.errors).toEqual({
        confirmPassword: 'Lösenorden måste matcha varandra',
      });
    });
  });
});
