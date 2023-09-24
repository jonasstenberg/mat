import { parse } from 'tinyduration';

export const convertDurationtoMinutes = (prepTime: string, cookTime: string, totalTime: string) => {
  try {
    const prep_time = prepTime ? parse(prepTime).minutes ?? 0 : 0;
    let cook_time = cookTime ? parse(cookTime).minutes ?? 0 : 0;

    if (prep_time === 0 && cook_time === 0 && totalTime) {
      cook_time = parse(totalTime).minutes ?? 0;
    }

    return { prep_time, cook_time };
  } catch {
    if (prepTime && cookTime) {
      return { prep_time: parseInt(prepTime, 10), cook_time: parseInt(cookTime, 10) };
    }
    if (!prepTime && cookTime) {
      return { prep_time: 0, cook_time: parseInt(cookTime, 10) };
    }
    return { prep_time: 0, cook_time: 0 };
  }
};
