'use client';

import { Select } from '@mantine/core';
import { usePathname, useRouter } from 'next/navigation';
import { useEffect } from 'react';
import { useFilter } from '@/hooks/useFilter';

type FiltersProps = {
  categories: string[];
  filteredCategoryParam: string;
};

export default function Filters({ categories, filteredCategoryParam }: FiltersProps) {
  const { filteredCategory, setFilteredCategory } = useFilter();
  const router = useRouter();
  const pathname = usePathname();

  useEffect(() => {
    setFilteredCategory(filteredCategoryParam);
  }, [filteredCategoryParam]);

  const handleCategorySelect = (c: string | null) => {
    const params = new URLSearchParams(window.location.search);
    if (c && c.length && c !== 'all') {
      params.set('category', c);
    } else {
      params.delete('category');
    }

    setFilteredCategory(c);
    router.push(`${pathname}?${params.toString()}`);
  };

  return (
    <Select
      label="Välj kategori"
      placeholder="Middag"
      w="20rem"
      data={[
        { label: 'Alla kategorier', value: 'all' },
        ...categories.map((c) => ({ label: c, value: c })),
      ]}
      defaultValue={filteredCategory ?? filteredCategoryParam}
      checkIconPosition="right"
      onChange={handleCategorySelect}
    />
  );
}
