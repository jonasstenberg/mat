'use client';

import { Select } from '@mantine/core';
import { usePathname, useRouter } from 'next/navigation';
import { useFilter } from '@/hooks/useFilter';

export default function Sort() {
  const { sortValue, setSortValue } = useFilter();
  const router = useRouter();
  const pathname = usePathname();

  const handleSort = (s: string | null) => {
    const params = new URLSearchParams(window.location.search);
    if (s === 'Bokstavsordning') {
      params.set('sort', 'alphabetic');
    } else {
      params.delete('sort');
    }

    setSortValue(s);
    router.push(`${pathname}?${params.toString()}`);
  };

  return (
    <Select
      label="Sortera"
      defaultValue={sortValue}
      data={['Nyheter', 'Bokstavsordning']}
      checkIconPosition="right"
      onChange={handleSort}
    />
  );
}
