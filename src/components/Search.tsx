'use client';

import { TextInput } from '@mantine/core';
import { useDebouncedValue, useMediaQuery } from '@mantine/hooks';

import { useEffect, useState, useTransition } from 'react';
import { usePathname, useRouter } from 'next/navigation';

import styles from '../app/page.module.css';

export default function Search() {
  const [search, setSearch] = useState('');
  const router = useRouter();
  const pathname = usePathname();
  const [, startTransition] = useTransition();

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

    startTransition(() => {
      router.replace(`${pathname}?${params.toString()}`);
    });
  }, [debouncedValue, pathname, router.replace]);

  return (
    <TextInput
      radius="xl"
      size={mid ? 'lg' : small ? 'md' : 'sm'}
      pt=""
      px="lg"
      maw="40rem"
      className={styles['search-input']}
      placeholder="Sök ingrediens eller recept"
      onChange={(e: React.ChangeEvent<HTMLInputElement>) => setSearch(e.target.value)}
    />
  );
}