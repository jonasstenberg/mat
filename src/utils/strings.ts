export const capitalizeFirstLetter = (string: string) =>
  string.charAt(0).toUpperCase() + string.slice(1);

export const replaceWrittenNumbersWithNumerals = (originalText: string): string => {
  let text = originalText;
  if (!text) {
    return '';
  }
  if (Array.isArray(originalText)) {
    [text] = originalText;
  }
  if (!/[a-zA-Z]/.test(text)) {
    return text;
  }

  const wordToNum: { [key: string]: string } = {
    zero: '0',
    one: '1',
    two: '2',
    three: '3',
    four: '4',
    five: '5',
    six: '6',
    seven: '7',
    eight: '8',
    nine: '9',
    ten: '10',
  };

  const words: string[] = text.split(' ');
  const replacedWords: string[] = words.map((word) => wordToNum[word.toLowerCase()] || word);

  return replacedWords.join(' ');
};
