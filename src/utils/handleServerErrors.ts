import { notifications } from '@mantine/notifications';
import { UNKNOWN_ERROR } from './errors';

type Errors = {
  [key: string]: string | Errors;
};

export const handleServerErrors = async <T extends Errors>(
  response: { errors?: T },
  form?: { setFieldError: (key: string, message: string) => void }
) => {
  const { errors } = response;

  if (errors && Object.keys(errors).length) {
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
