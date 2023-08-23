import { notifications } from '@mantine/notifications';

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
        notifications.show({
          title: '😱',
          message: errorMessage,
        });
      }
    });
    return false;
  }

  return true;
};
