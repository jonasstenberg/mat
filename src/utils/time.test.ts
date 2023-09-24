import { convertDurationtoMinutes } from '@/utils/time';

describe('convertTime', () => {
  it('converts time correctly', () => {
    expect(convertDurationtoMinutes('PT15M', 'PT30M', 'PT45M')).toEqual({
      prep_time: 15,
      cook_time: 30,
    });
  });
});
