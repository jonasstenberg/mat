export const convertDecimalToFraction = (input: string): string => {
  if (!input) {
    return '';
  }

  const n = Number(input);
  if (Number.isNaN(n)) {
    return input;
  }

  const intPart = Math.floor(n);
  const decimalPart = n - intPart;

  // Define the maximum denominator (e.g., 5 for fractions up to x/5)
  const maxDenominator = 5;

  let bestNumerator = 0;
  let bestDenominator = 1;
  let minDifference = decimalPart;

  // Iterate over possible denominators, find the numerator that minimizes the difference
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

  return intPart > 0 ? `${intPart} ${fractionString}` : fractionString;
};

export const convertDecimalInStringToFraction = (input: string): string => {
  const pattern = /\d+\.\d+/g;

  return input.replace(pattern, (match) => convertDecimalToFraction(match));
};

const fractionToDecimal = (fraction: string) => {
  const [numerator, denominator] = fraction.split('/').map(Number);
  return denominator ? numerator / denominator : numerator;
};

export const normalizeIngredient = (
  ingredient: { quantity: string; measurement: string; name: string },
  recipeYield: number,
  newYield: number
) => {
  // Normalize ingredient.quantity
  let normalizedQuantity = (Number(ingredient.quantity) / recipeYield) * newYield;

  if (ingredient.measurement === 'g') {
    normalizedQuantity = Math.round(normalizedQuantity); // Round to the nearest whole number if measurement is "g"
  }

  const quantityString =
    ingredient.measurement === 'g'
      ? normalizedQuantity.toString()
      : convertDecimalToFraction(normalizedQuantity.toString());

  // Check if ingredient.name contains a pattern like "(1/2 dl)" or "(ca 1/2 dl)"
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
    measurement: ingredient.measurement,
    name,
  };
};
