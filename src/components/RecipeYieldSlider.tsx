'use client';

import { usePathname, useRouter, useSearchParams } from 'next/navigation';
import { Slider } from '@mantine/core';
import { useEffect, useState } from 'react';

export const yieldStepper = Array.from({ length: 24 }, (_, index) => index + 1).map((value) => ({
  label: value.toString(),
  value,
}));

export default function RecipeYieldSlider({ recipeYield }: { recipeYield: number }) {
  const router = useRouter();
  const pathname = usePathname();
  const searchParams = useSearchParams();
  const current = new URLSearchParams(Array.from(searchParams.entries()));
  const [sliderValue, setSliderValue] = useState<number>(recipeYield);

  useEffect(() => {
    setSliderValue(recipeYield);
  }, [recipeYield]);

  const updateYield = (value: number) => {
    current.set('yield', value.toString());
    const search = current.toString();
    const query = search ? `?${search}` : '';
    router.replace(`${pathname}${query}`, {
      scroll: false,
    });
  };

  return (
    <>
      <Slider
        min={1}
        max={24}
        value={sliderValue}
        defaultValue={recipeYield}
        step={1}
        marks={yieldStepper}
        mt="0.25rem"
        styles={{ markLabel: { display: 'none' } }}
        labelAlwaysOn
        onChange={setSliderValue}
        onChangeEnd={updateYield}
      />
    </>
  );
}
