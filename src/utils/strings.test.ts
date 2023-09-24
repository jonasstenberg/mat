import { capitalizeFirstLetter, replaceWrittenNumbersWithNumerals } from '@/utils/strings';

describe('capitalizeFirstLetter', () => {
  it('should capitalize the first letter of a lowercase string', () => {
    expect(capitalizeFirstLetter('hello')).toBe('Hello');
  });

  it('should leave the string unchanged if the first letter is already capitalized', () => {
    expect(capitalizeFirstLetter('World')).toBe('World');
  });

  it('should handle empty strings gracefully', () => {
    expect(capitalizeFirstLetter('')).toBe('');
  });

  it('should handle single-character strings', () => {
    expect(capitalizeFirstLetter('a')).toBe('A');
    expect(capitalizeFirstLetter('Z')).toBe('Z');
  });

  it('should not change the rest of the string', () => {
    expect(capitalizeFirstLetter('hello WORLD')).toBe('Hello WORLD');
  });
});

describe('replaceWrittenNumbersWithNumerals function', () => {
  it('should replace written numbers with actual numbers', () => {
    expect(replaceWrittenNumbersWithNumerals('Two servings')).toBe('2 servings');
    expect(replaceWrittenNumbersWithNumerals('One apple')).toBe('1 apple');
    expect(replaceWrittenNumbersWithNumerals('Ten cars')).toBe('10 cars');
  });

  it('should handle case insensitivity', () => {
    expect(replaceWrittenNumbersWithNumerals('tWO servings')).toBe('2 servings');
    expect(replaceWrittenNumbersWithNumerals('ONE apple')).toBe('1 apple');
  });

  it('should handle multiple replacements', () => {
    expect(replaceWrittenNumbersWithNumerals('One apple and two oranges')).toBe(
      '1 apple and 2 oranges'
    );
  });

  it('should leave text unchanged if no written numbers are present', () => {
    expect(replaceWrittenNumbersWithNumerals('apple and oranges')).toBe('apple and oranges');
  });

  it('should handle empty strings', () => {
    expect(replaceWrittenNumbersWithNumerals('')).toBe('');
  });
});
