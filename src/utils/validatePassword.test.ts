import { isValidPassword } from '@/utils/validatePassword';

describe('isValidPassword', () => {
  it('should return false for passwords shorter than 8 characters', () => {
    expect(isValidPassword('Abc12')).toBe(false);
  });

  it('should return false for passwords without uppercase letters', () => {
    expect(isValidPassword('abcdef123')).toBe(false);
  });

  it('should return false for passwords without lowercase letters', () => {
    expect(isValidPassword('ABCDEF123')).toBe(false);
  });

  it('should return false for passwords without numbers', () => {
    expect(isValidPassword('Abcdef')).toBe(false);
  });

  it('should return true for valid passwords', () => {
    expect(isValidPassword('Abcdef123')).toBe(true);
  });
});
