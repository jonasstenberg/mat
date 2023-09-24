import { ZodSchema } from 'zod';

type ValidationResult<T> = {
  success: boolean;
  data?: T;
  errors?: Record<string, string>;
};

export const validateSchema = <T>(schema: ZodSchema<T>, data: unknown): ValidationResult<T> => {
  const result = schema.safeParse(data);

  if (!result.success) {
    const zodErrors: Record<string, string> = {};

    result.error.issues.forEach((issue) => {
      if (issue.path.length > 0) {
        const pathString = issue.path.join('.');
        zodErrors[pathString] = issue.message || 'Unknown error';
      } else {
        zodErrors._general = issue.message || 'General validation error';
      }
    });

    return {
      success: false,
      errors: zodErrors,
    };
  }

  return {
    success: true,
    data: result.data,
  };
};
