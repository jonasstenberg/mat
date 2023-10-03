import {
  convertDecimalInStringToFraction,
  convertDecimalToFraction,
  fractionToDecimal,
  normalizeIngredient,
  parseIngredient,
} from '@/utils/ingredientParser';

describe('convertDecimalToFraction', () => {
  it('should convert a decimal number to a fraction', () => {
    expect(convertDecimalToFraction('1.5')).toBe('1 1/2');
    expect(convertDecimalToFraction('0.66')).toBe('2/3');
  });
  it('should return empty string for empty input', () => {
    expect(convertDecimalToFraction('')).toBe('');
  });
  it('should return original input for NaN input', () => {
    expect(convertDecimalToFraction('NaN')).toBe('NaN');
    expect(convertDecimalToFraction('abc')).toBe('abc');
  });
  it('should return integers if the decimal part is zero', () => {
    expect(convertDecimalToFraction('2.0')).toBe('2');
  });
  it('should handle decimals greater than 1 correctly', () => {
    expect(convertDecimalToFraction('1.25')).toBe('1 1/4');
  });
});

describe('convertDecimalInStringToFraction', () => {
  it('should convert decimal numbers in a string to fractions', () => {
    expect(convertDecimalInStringToFraction('I have 1.5 apples and 0.66 oranges')).toBe(
      'I have 1 1/2 apples and 2/3 oranges'
    );
  });
});

describe('fractionToDecimal', () => {
  it('should convert a fraction to a decimal number', () => {
    expect(fractionToDecimal('1/2')).toBe(0.5);
    expect(fractionToDecimal('2/3')).toBeCloseTo(0.67, 4);
  });
  it('should handle invalid fraction strings gracefully', () => {
    expect(fractionToDecimal('invalid')).toBeNaN();
    expect(fractionToDecimal('1/a')).toBeNaN();
    expect(fractionToDecimal('a/1')).toBeNaN();
  });
  it('should handle fractions with whole numbers', () => {
    expect(fractionToDecimal('1 1/2')).toBe(1.5);
  });
});

describe('normalizeIngredient', () => {
  it('should normalize an ingredient object based on yield', () => {
    const ingredient = {
      quantity: '1',
      measurement: 'g',
      name: 'sugar',
    };
    expect(normalizeIngredient(ingredient, 2, 4)).toEqual({
      quantity: '2',
      measurement: 'g',
      name: 'sugar',
    });
  });
  it('should normalize fractions correctly', () => {
    const ingredient = {
      quantity: '1/2',
      measurement: 'cup',
      name: 'sugar',
    };
    expect(normalizeIngredient(ingredient, 1, 2)).toEqual({
      quantity: '1',
      measurement: 'cup',
      name: 'sugar',
    });
  });
  it('should handle unknown units gracefully and convert to preferred units', () => {
    const ingredient = {
      quantity: '1',
      measurement: 'unknown',
      name: 'ingredient',
    };
    expect(normalizeIngredient(ingredient, 1, 2)).toEqual({
      quantity: '2',
      measurement: 'unknown',
      name: 'ingredient',
    });
  });
});

describe('parseIngredient', () => {
  it('should parse a well-formed ingredient string', () => {
    expect(parseIngredient('1 1/2 cup sugar')).toEqual({
      quantity: '1.5',
      measurement: 'cup',
      name: 'sugar',
    });
    expect(parseIngredient('2 tbsp olive oil')).toEqual({
      quantity: '2',
      measurement: 'tbsp',
      name: 'olive oil',
    });
  });
  it('should handle strings with special fraction characters', () => {
    expect(parseIngredient('1 ½ cup sugar')).toEqual({
      quantity: '1.5',
      measurement: 'cup',
      name: 'sugar',
    });
  });
  it('should return correct values for missing parts', () => {
    expect(parseIngredient('sugar')).toEqual({
      quantity: '',
      measurement: '',
      name: 'sugar',
    });
  });
  it('should handle strings with multiple spaces and odd formatting gracefully', () => {
    expect(parseIngredient('  1    ½   cup   sugar  ')).toEqual({
      quantity: '1.5',
      measurement: 'cup',
      name: 'sugar',
    });
  });
  it('should parse ingredient with quantity in parentheses correctly', () => {
    expect(parseIngredient('sugar (1 ½ cup)')).toEqual({
      quantity: '1.5',
      measurement: 'cup',
      name: 'sugar',
    });
  });
});
