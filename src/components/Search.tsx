'use client';

import { TextInput } from '@mantine/core';
import { useDebouncedValue, useMediaQuery } from '@mantine/hooks';

import { useEffect, useState } from 'react';
import { usePathname, useRouter } from 'next/navigation';

import styles from '../app/page.module.css';

export default function Search({ searchQuery }: { searchQuery: string }) {
  const [search, setSearch] = useState<string>(searchQuery || '');
  const router = useRouter();
  const pathname = usePathname();

  const [debouncedValue] = useDebouncedValue(search, 500);

  const mid = useMediaQuery('(min-width: 48rem)');
  const small = useMediaQuery('(min-width: 36rem)');

  useEffect(() => {
    const params = new URLSearchParams(window.location.search);

    if (debouncedValue) {
      params.set('search', debouncedValue);
    } else {
      params.delete('search');
    }

    router.push(`${pathname}?${params.toString()}`);
  }, [debouncedValue, pathname, router.replace]);

  return (
    <TextInput
      radius="xl"
      size={mid ? 'lg' : small ? 'md' : 'sm'}
      pt=""
      px="lg"
      maw="40rem"
      value={search}
      classNames={{
        root: styles['search-input'],
        input: styles['search-input-field'],
      }}
      placeholder="Sök ingrediens eller recept"
      onChange={(e: React.ChangeEvent<HTMLInputElement>) => setSearch(e.target.value)}
    />
  );
}
