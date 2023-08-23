'use client';

import { usePathname, useRouter, useSearchParams } from 'next/navigation';
import { Slider } from '@mantine/core';
import { useState } from 'react';

const yieldStepper = Array.from({ length: 13 }, (_, index) => (index === 0 ? 1 : index * 2)).map(
  (value) => ({
    label: value.toString(),
    value,
  })
);

const desiredValues = Array.from({ length: 13 }, (_, index) => (index === 0 ? 1 : index * 2));

const getClosest = (value: number) =>
  desiredValues.reduce((prev, curr) =>
    Math.abs(curr - value) < Math.abs(prev - value) ? curr : prev
  );

export default function RecipeYieldSlider({ recipeYield }: { recipeYield: number }) {
  const router = useRouter();
  const pathname = usePathname();
  const searchParams = useSearchParams();
  const current = new URLSearchParams(Array.from(searchParams.entries()));

  const [, setSliderValue] = useState(recipeYield);
  const [tempValue, setTempValue] = useState(recipeYield); // new state for visual position

  const updateYield = (value: number) => {
    const adjustedValue = getClosest(value);
    current.set('yield', adjustedValue.toString());
    const search = current.toString();
    const query = search ? `?${search}` : '';
    router.replace(`${pathname}${query}`, {
      scroll: false,
    });
  };

  const handleSliderChange = (value: number) => {
    const closestValue = getClosest(value);
    setTempValue(closestValue); // snap to the closest desired value during drag
  };

  const handleSliderChangeEnd = (value: number) => {
    const closestValue = getClosest(value);
    setSliderValue(closestValue); // update the "actual" value
    setTempValue(closestValue); // also adjust the visual position to snap to the desired value
    updateYield(closestValue);
  };

  return (
    <>
      <Slider
        min={1}
        max={24}
        value={tempValue} // bind to tempValue for visual feedback
        defaultValue={recipeYield}
        step={1}
        marks={yieldStepper}
        mt="0.25rem"
        styles={{ markLabel: { display: 'none' } }}
        labelAlwaysOn
        onChange={handleSliderChange}
        onChangeEnd={handleSliderChangeEnd}
      />
    </>
  );
}
