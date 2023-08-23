import { ZodSchema } from 'zod';

type ValidationResult<T> = {
  success: boolean;
  data?: T;
  errors?: Record<string, string>;
};

export const validateSchema = <T>(schema: ZodSchema<T>, data: unknown): ValidationResult<T> => {
  const result = schema.safeParse(data);

  if (!result.success) {
    let zodErrors: Record<string, string> = {};
    result.error.issues.forEach((issue) => {
      zodErrors = { ...zodErrors, [issue.path[0]]: issue.message };
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
