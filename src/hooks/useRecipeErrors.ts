import { useState } from 'react';

export interface Errors {
  recipeName?: string;
  servings?: string;
  prep_time?: string;
  cook_time?: string;
  categories?: string;
  ingredients?: string;
  description?: string;
}

export const useErrors = () => {
  const [errors, setErrors] = useState<Errors>({});

  const resetError = (field: keyof Errors) => {
    setErrors((prevErrors) => {
      const newErrors = { ...prevErrors };
      delete newErrors[field];
      return newErrors;
    });
  };

  return { errors, setErrors, resetError };
};
