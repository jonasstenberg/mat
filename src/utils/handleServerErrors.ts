import { notifications } from '@mantine/notifications';
import { UNKNOWN_ERROR } from './errors';
import { Result, ResultVoid } from './result';

export const validateServerResponse = <T>(
  response: Result<T> | ResultVoid,
  form?: { setFieldError: (key: string, message: string) => void }
): boolean => {
  if (!response.success && response.errors) {
    const { errors } = response;

    Object.keys(errors).forEach((key) => {
      const error = errors[key];
      const errorMessage = typeof error === 'string' ? error : JSON.stringify(error);

      if (form) {
        form.setFieldError(key, errorMessage);
      }

      if (key === 'global') {
        notifications.show(UNKNOWN_ERROR);
      }
    });
    return false;
  }

  return true;
};
