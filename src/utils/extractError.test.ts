import { UNKNOWN_ERROR } from '@/utils/errors'; // make sure this path is correct
import { extractError } from '@/utils/extractError';

describe('extractError', () => {
  it('should extract message from Error instance', () => {
    const error = new Error('This is an error message.');
    expect(extractError(error)).toBe('This is an error message.');
  });

  it('should extract message from object with message property', () => {
    const error = { message: 'Object error message' };
    expect(extractError(error)).toBe('Object error message');
  });

  it('should return the string if error is a string', () => {
    const error = 'String error message';
    expect(extractError(error)).toBe('String error message');
  });

  it('should return UNKNOWN_ERROR message for other types', () => {
    expect(extractError(null)).toBe(UNKNOWN_ERROR.message);
    expect(extractError(undefined)).toBe(UNKNOWN_ERROR.message);
    expect(extractError(42)).toBe(UNKNOWN_ERROR.message);
    expect(extractError([])).toBe(UNKNOWN_ERROR.message);
  });

  it('should handle object without message property', () => {
    const error = { notMessage: 'This should not be returned' };
    expect(extractError(error)).toBe(UNKNOWN_ERROR.message);
  });
});
