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

type BaseUnits = (typeof knownUnits)[number];

type Unit = keyof typeof conversionFactors;

const conversionFactors: Record<BaseUnits, number> = {
  g: 1,
  kg: 1000,
  ml: 1,
  l: 1000,
  oz: 28.3495,
  lb: 453.592,
  'fl oz': 29.5735,
  gal: 3785.41,
  tbsp: 14.7868,
  tsp: 4.92892,
  cup: 236.588,
  cups: 236.588,
  dash: 0.616115,
  pinch: 0.3080575,
  smidgen: 0.1540288,
  drop: 0.05,
  scoop: 20,
  bag: 500,
  box: 200,
  jar: 300,
  can: 400,
  packet: 50,
  pack: 100,
  bottle: 750,
  msk: 15,
  tsk: 5,
  krm: 1,
  pound: 453.592,
};

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

export const convertUnits = (fromUnit: Unit, toUnit: Unit, quantity: number): number | null => {
  const fromFactor = conversionFactors[fromUnit];
  const toFactor = conversionFactors[toUnit];

  if (fromFactor === undefined || toFactor === undefined) {
    return null;
  }

  const quantityInGrams = quantity * fromFactor;
  const convertedQuantity = quantityInGrams / toFactor;

  return convertedQuantity;
};

type UnitSystem = 'metric' | 'common_volume' | 'imperial';

const preferredUnitsMap: Record<UnitSystem, Unit[]> = {
  metric: ['g', 'kg', 'ml', 'cl', 'dl', 'l'],
  imperial: ['oz', 'lb', 'fl oz', 'gal', 'pt', 'qt'],
  common_volume: [
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
  ],
};

function convertToPreferredUnit(
  quantity: number,
  unit: Unit,
  preferredUnitGroups: UnitSystem[]
): { quantity: number; unit: Unit } {
  let newQuantity = quantity;
  let newUnit = unit;

  const foundPreferred = preferredUnitGroups.some((group) => {
    const unitsInGroup = preferredUnitsMap[group];

    if (unitsInGroup.includes(unit)) {
      return true; // Already in preferred unit, break out of loop
    }

    return unitsInGroup.some((preferredUnit) => {
      if (conversionFactors[preferredUnit] !== undefined && conversionFactors[unit] !== undefined) {
        newQuantity = (quantity * conversionFactors[unit]) / conversionFactors[preferredUnit];
        newUnit = preferredUnit;
        return true; // Converted to preferred unit, break out of loop
      }
      return false;
    });
  });

  if (foundPreferred) {
    return { quantity: newQuantity, unit: newUnit };
  }

  return { quantity, unit }; // Could not convert, return original
}

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
  newYield: number,
  preferredSystems: UnitSystem[]
) => {
  const isRange = ingredient.quantity.includes('-');
  let normalizedQuantity: number | number[] = 0;
  let newUnit = ingredient.measurement;

  // Check for a range in quantity like '1-2'
  if (isRange) {
    const [min, max] = ingredient.quantity.split('-').map((str) => str.trim());
    const minNormalized = Math.round((fractionToDecimal(min) / recipeYield) * newYield);
    const maxNormalized = Math.round((fractionToDecimal(max) / recipeYield) * newYield);
    normalizedQuantity = [minNormalized, maxNormalized];
  } else {
    normalizedQuantity = (fractionToDecimal(ingredient.quantity) / recipeYield) * newYield;
  }

  // Then proceed to convert to preferred unit if it's a known unit
  if (knownUnits.includes(ingredient.measurement)) {
    const converted = convertToPreferredUnit(
      normalizedQuantity as number,
      ingredient.measurement as Unit,
      preferredSystems
    );
    normalizedQuantity = converted.quantity;
    newUnit = converted.unit;
  }

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
