'use client';

import { signIn } from 'next-auth/react';
import { Button, Text, Drawer, PasswordInput, Stack, TextInput } from '@mantine/core';
import { IconLogin } from '@tabler/icons-react';
import { useState } from 'react';
import { useSearchParams } from 'next/navigation';
import { useLoginDrawer } from '@/hooks/useLoginDrawer';

export default function LoginDrawer() {
  const searchParams = useSearchParams();
  const callbackUrl = searchParams.get('callbackUrl') || '/';

  const { opened, handlers } = useLoginDrawer();

  const [loading, setLoading] = useState<boolean>(false);
  const [error, setError] = useState<string>('');
  const [email, setEmail] = useState<string>('');
  const [password, setPassword] = useState<string>('');

  const onSubmit = async (e: React.FormEvent) => {
    e.preventDefault();

    if (!email.length || !password.length) {
      setError('You must supply both email and password');
      return;
    }
    try {
      setLoading(true);

      const res = await signIn('credentials', {
        redirect: false,
        email,
        password,
        callbackUrl,
      });

      setLoading(false);

      if (!res?.error) {
        setEmail('');
        setPassword('');
        setError('');
        window.location.reload();
      } else {
        setError('Invalid email or password');
      }
    } catch (err: any) {
      setLoading(false);
      setError(err);
    }
  };

  return (
    <Drawer opened={opened} onClose={handlers.close} title="Login">
      <form onSubmit={onSubmit}>
        <Stack gap="sm">
          {error && (
            <Text c="red" size="xs">
              {error}
            </Text>
          )}
          <TextInput
            label="Email"
            placeholder="example@example.com"
            withAsterisk
            onChange={(e) => {
              setEmail(e.currentTarget.value);
            }}
          />
          <PasswordInput
            label="Password"
            placeholder="****"
            onChange={(e) => {
              setPassword(e.currentTarget.value);
            }}
          />
          <Button leftSection={<IconLogin size={20} />} type="submit" loading={loading}>
            Login
          </Button>
        </Stack>
      </form>
    </Drawer>
  );
}
