import he from 'he';

export const decodeHtmlEntities = (str: string): string => {
  if (!str) {
    return '';
  }
  return he.decode(str);
};
