'use client';

import React, { useState } from 'react';

type FilterContextType = {
  sortValue: string | null;
  setSortValue: React.Dispatch<React.SetStateAction<string | null>>;
  filteredCategory: string | null;
  setFilteredCategory: React.Dispatch<React.SetStateAction<string | null>>;
};

export const FilterContext = React.createContext<FilterContextType | undefined>(undefined);

type FilterProviderProps = {
  children: React.ReactNode;
};

export const FilterProvider = ({ children }: FilterProviderProps) => {
  const [sortValue, setSortValue] = useState<FilterContextType['sortValue']>('Nyheter');
  const [filteredCategory, setFilteredCategory] =
    useState<FilterContextType['filteredCategory']>(null);

  return (
    <FilterContext.Provider
      value={{ sortValue, setSortValue, filteredCategory, setFilteredCategory }}
    >
      {children}
    </FilterContext.Provider>
  );
};
