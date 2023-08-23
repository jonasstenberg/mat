export const createFormData = <T extends Record<string, any>>(input: T): FormData => {
  const formData = new FormData();

  Object.keys(input).forEach((key) => {
    const value: any = input[key as keyof T];

    if (value !== null && value !== undefined) {
      switch (typeof value) {
        case 'string':
        case 'number':
          formData.append(key, value.toString());
          break;
        case 'object':
          if (value instanceof File) {
            formData.append(key, value);
          } else if (Array.isArray(value)) {
            formData.append(key, JSON.stringify(value));
          }
          break;
      }
    }
  });

  return formData;
};
