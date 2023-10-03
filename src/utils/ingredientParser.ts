import { decodeHtmlEntities } from '@/utils/decoder';

const knownUnits = [
  // Metric units
  'g',
  'hg',
  'kg',
  'ml',
  'cl',
  'dl',
  'l',

  // Imperial units
  'oz',
  'lb',
  'fl oz',
  'gal',
  'pt',
  'qt',

  // Common volume measures
  'tbsp',
  'tbl',
  'tbs',
  'tablespoon',
  'tablespoons',
  'tsp',
  'teaspoon',
  'teaspoons',
  'cup',
  'cups',
  'tsp',
  'tbsp',
  'ounce',
  'ounces',

  // Less common units
  'dash',
  'pinch',
  'smidgen',
  'drop',
  'scoop',

  // Large quantities
  'bag',
  'box',
  'jar',
  'can',
  'packet',
  'pack',
  'bottle',

  // Swedish units
  'msk',
  'tsk',
  'krm',
  'förp',

  // Other units
  'pound',
];

const unicodeFractionMap: { [key: string]: string } = {
  '½': '1/2',
  '⅓': '1/3',
  '⅔': '2/3',
  '¼': '1/4',
  '¾': '3/4',
  '⅕': '1/5',
  '⅖': '2/5',
  '⅗': '3/5',
  '⅘': '4/5',
  '⅙': '1/6',
  '⅚': '5/6',
  '⅐': '1/7',
  '⅛': '1/8',
  '⅜': '3/8',
  '⅝': '5/8',
  '⅞': '7/8',
  '⅑': '1/9',
  '⅒': '1/10',
};

const singleValueToFraction = (input: string): string => {
  const n = Number(input);
  if (Number.isNaN(n)) {
    return input;
  }

  const intPart = Math.floor(n);
  const decimalPart = n - intPart;

  const maxDenominator = 5;

  let bestNumerator = 0;
  let bestDenominator = 1;
  let minDifference = decimalPart;

  for (let denominator = 1; denominator <= maxDenominator; denominator += 1) {
    const numerator = Math.round(decimalPart * denominator);
    const difference = Math.abs(decimalPart - numerator / denominator);

    if (difference < minDifference) {
      bestNumerator = numerator;
      bestDenominator = denominator;
      minDifference = difference;
    }
  }

  let fractionString = `${bestNumerator}/${bestDenominator}`;
  if (bestNumerator === 0) {
    fractionString = '';
  } else if (bestDenominator === 1) {
    fractionString = String(bestNumerator);
  }

  const space = intPart > 0 && fractionString ? ' ' : '';

  return `${intPart || ''}${space}${fractionString}`.trim();
};

export const convertDecimalToFraction = (input: string): string => {
  if (!input) {
    return '';
  }

  if (input.includes('-')) {
    const [min, max] = input.split('-').map((str) => str.trim());
    const minFraction = singleValueToFraction(min);
    const maxFraction = singleValueToFraction(max);
    return `${minFraction}-${maxFraction}`;
  }
  return singleValueToFraction(input);
};

export const convertDecimalInStringToFraction = (input: string): string => {
  const pattern = /\d+\.\d+/g;

  return input.replace(pattern, (match) => convertDecimalToFraction(match));
};

export const fractionToDecimal = (fraction: string, numDecimals: number = 2) => {
  if (!fraction) return NaN;

  let normalizedFraction = fraction;

  Object.entries(unicodeFractionMap).forEach(([unicode, regular]) => {
    normalizedFraction = normalizedFraction.replace(new RegExp(unicode, 'g'), regular);
  });

  const validFractionRegex = /^[ \d/.]+$/;
  if (!validFractionRegex.test(normalizedFraction)) return NaN;

  let wholeNumber = 0;
  let numerator = 0;
  let denominator = 1;

  const parts = normalizedFraction.split(' ');
  parts.forEach((part) => {
    if (part.includes('/')) {
      const [n, d] = part.split('/').map(Number);
      numerator = n;
      denominator = d;
    } else {
      wholeNumber += Number(part);
    }
  });

  const result = wholeNumber + numerator / denominator;
  return parseFloat(result.toFixed(numDecimals));
};

export const normalizeIngredient = (
  ingredient: { quantity: string; measurement: string; name: string },
  recipeYield: number,
  newYield: number
) => {
  if (!ingredient.quantity) {
    return ingredient;
  }

  const isRange = ingredient.quantity.includes('-');
  let normalizedQuantity: number | number[] = 0;
  const newUnit = ingredient.measurement;

  // Check for a range in quantity like '1-2'
  if (isRange) {
    const [min, max] = ingredient.quantity.split('-').map((str) => str.trim());
    const minNormalized = Math.round((fractionToDecimal(min) / recipeYield) * newYield);
    const maxNormalized = Math.round((fractionToDecimal(max) / recipeYield) * newYield);
    normalizedQuantity = [minNormalized, maxNormalized];
  } else {
    normalizedQuantity = (fractionToDecimal(ingredient.quantity) / recipeYield) * newYield;
  }

  // No decimals on grams
  if (newUnit === 'g') {
    if (isRange) {
      normalizedQuantity = (normalizedQuantity as number[]).map(Math.round);
    } else {
      normalizedQuantity = Math.round(normalizedQuantity as number);
    }
  }

  let quantityString = '';
  if (isRange) {
    quantityString = (normalizedQuantity as number[]).join('-');
  } else {
    quantityString =
      newUnit === 'g'
        ? normalizedQuantity.toString()
        : convertDecimalToFraction((normalizedQuantity as number).toString());
  }

  let { name } = ingredient;
  const matches = name.match(/\((.+?)\)/);
  if (matches) {
    const contentInsideParens = matches[1];
    const quantityMatch = contentInsideParens.match(/([\d/\\.]+)/);
    if (quantityMatch) {
      const originalQuantity = fractionToDecimal(quantityMatch[1]);
      let normalizedQuantityInName = (originalQuantity / recipeYield) * newYield;

      if (/\d\s?g/.test(contentInsideParens)) {
        normalizedQuantityInName = Math.round(normalizedQuantityInName);
      }

      const fractionString = convertDecimalToFraction(normalizedQuantityInName.toString());
      const updatedContent = contentInsideParens.replace(quantityMatch[1], fractionString);
      name = name.replace(matches[0], `(${updatedContent})`);
    }
  }

  return {
    quantity: quantityString,
    measurement: newUnit,
    name,
  };
};

export const parseIngredient = (originalIngredient: string) => {
  let ingredient = originalIngredient.trim().replace(/(\d)([½⅓⅔¼¾⅕⅖⅗⅘⅙⅚⅐⅛⅜⅝⅞⅑⅒])/g, '$1 $2');

  ingredient = Object.entries(unicodeFractionMap).reduce(
    (acc, [specialFraction, normalFraction]) =>
      acc.replace(new RegExp(specialFraction, 'g'), normalFraction),
    ingredient
  );

  let quantity = '';
  let measurement = '';
  let name = '';

  const parentheticalMatch = ingredient.match(
    /(.+?)\s*\(([\d\s½⅓⅔¼¾⅕⅖⅗⅘⅙⅚⅐⅛⅜⅝⅞⅑⅒/\\.]+)\s*(.+)?\)/
  );
  if (parentheticalMatch) {
    name = decodeHtmlEntities(parentheticalMatch[1].trim());
    quantity = fractionToDecimal(parentheticalMatch[2]).toString();
    measurement = (parentheticalMatch[3] || '').trim();
    return { name, quantity, measurement };
  }

  const parts = ingredient.split(/\s+/).filter((str) => str);

  // Handling different kinds of quantity specifications
  if (parts.length >= 1 && /\d/.test(parts[0])) {
    const whole = parseFloat(parts.shift()!) || 0;
    const fraction =
      parts.length && /\d\/\d/.test(parts[0]) ? fractionToDecimal(parts.shift()!) : 0;
    quantity = (whole + fraction).toString();
  }

  // Once quantity is identified, next non-empty part is considered as a measurement if known
  if (parts.length && knownUnits.includes(parts[0].toLowerCase())) {
    measurement = parts.shift()!;
  }

  // Remaining parts are considered as the name of the ingredient
  name = parts.join(' ').trim();

  return {
    name: decodeHtmlEntities(name),
    quantity,
    measurement,
  };
};
