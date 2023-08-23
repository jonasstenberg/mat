'use client';

import { Button, ButtonProps } from '@mantine/core';
import GoogleIcon from './GoogleIcon';

export function GoogleButton<C = 'button'>(props: C | ButtonProps) {
  return <Button leftSection={<GoogleIcon />} variant="default" color="gray" {...props} />;
}
