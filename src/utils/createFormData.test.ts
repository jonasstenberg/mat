import { createFormData } from '@/utils/createFormData';

describe('createFormData', () => {
  const mockAppend = jest.fn();

  beforeEach(() => {
    (global as any).FormData = jest.fn().mockImplementation(() => ({
      append: mockAppend,
    }));
  });

  afterEach(() => {
    mockAppend.mockReset();
  });

  it('should append string and number values', () => {
    const input = {
      a: 'string',
      b: 42,
    };

    createFormData(input);

    expect(mockAppend).toHaveBeenCalledWith('a', 'string');
    expect(mockAppend).toHaveBeenCalledWith('b', '42');
  });

  it('should append File object', () => {
    const file = new File(['content'], 'filename.txt', { type: 'text/plain' });
    const input = {
      a: file,
    };

    createFormData(input);

    expect(mockAppend).toHaveBeenCalledWith('a', file);
  });

  it('should append arrays as JSON strings', () => {
    const input = {
      a: [1, 2, 3],
    };

    createFormData(input);

    expect(mockAppend).toHaveBeenCalledWith('a', JSON.stringify([1, 2, 3]));
  });

  it('should not append null or undefined values', () => {
    const input = {
      a: null,
      b: undefined,
    };

    createFormData(input);

    expect(mockAppend).not.toHaveBeenCalledWith('a', null);
    expect(mockAppend).not.toHaveBeenCalledWith('b', undefined);
  });

  it('should handle mixed types', () => {
    const file = new File(['content'], 'filename.txt', { type: 'text/plain' });
    const input = {
      a: 'string',
      b: 42,
      c: file,
      d: [1, 2, 3],
      e: null,
      f: undefined,
    };

    createFormData(input);

    expect(mockAppend).toHaveBeenCalledWith('a', 'string');
    expect(mockAppend).toHaveBeenCalledWith('b', '42');
    expect(mockAppend).toHaveBeenCalledWith('c', file);
    expect(mockAppend).toHaveBeenCalledWith('d', JSON.stringify([1, 2, 3]));
    expect(mockAppend).not.toHaveBeenCalledWith('e', null);
    expect(mockAppend).not.toHaveBeenCalledWith('f', undefined);
  });
});
