'use client';

import { usePathname, useRouter, useSearchParams } from 'next/navigation';
import { Slider } from '@mantine/core';

export default function ServingsSlider({ servings }: { servings: number }) {
  const router = useRouter();
  const pathname = usePathname();
  const searchParams = useSearchParams();
  const current = new URLSearchParams(Array.from(searchParams.entries()));

  const updateServings = (value: number) => {
    current.set('servings', value.toString());
    const search = current.toString();
    const query = search ? `?${search}` : '';
    router.replace(`${pathname}${query}`, {
      scroll: false,
    });
  };

  const servingsStepper = Array.from({ length: 12 }, (_, index) => (index + 1) * 2).map(
    (value) => ({
      label: value,
      value,
    })
  );
  return (
    <>
      <Slider
        min={2}
        max={24}
        defaultValue={servings}
        step={2}
        marks={servingsStepper}
        mt="0.25rem"
        styles={{ markLabel: { display: 'none' } }}
        labelAlwaysOn
        onChangeEnd={updateServings}
      />
    </>
  );
}
