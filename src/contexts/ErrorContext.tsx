'use client';

import React, { useState } from 'react';

export type Errors = {
  recipeName?: string;
  recipe_yield?: string;
  prep_time?: string;
  cook_time?: string;
  categories?: string;
  ingredients?: string;
  description?: string;
};

type ErrorContextType = {
  errors: Errors | undefined | null;
  setErrors: (errors: Errors) => void;
  resetError: (field: keyof Errors) => void;
};

export const ErrorContext = React.createContext<ErrorContextType | undefined>(undefined);

type ErrorProviderProps = {
  children: React.ReactNode;
};

export const ErrorProvider = ({ children }: ErrorProviderProps) => {
  const [errors, setErrors] = useState<Errors | undefined | null>(null);

  const resetError = (field: keyof Errors) => {
    setErrors((prevErrors) => {
      const newErrors = { ...prevErrors };
      delete newErrors[field];
      return newErrors;
    });
  };

  return (
    <ErrorContext.Provider value={{ errors, setErrors, resetError }}>
      {children}
    </ErrorContext.Provider>
  );
};
