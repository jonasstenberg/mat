import { decodeHtmlEntities } from '@/utils/decoder';

describe('decodeHtmlEntities', () => {
  it('decodes HTML entities correctly', () => {
    expect(decodeHtmlEntities('&amp;')).toBe('&');
    expect(decodeHtmlEntities('&lt;')).toBe('<');
  });
});
