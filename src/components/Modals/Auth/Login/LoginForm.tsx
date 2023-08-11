'use client';

import { useSearchParams } from 'next/navigation';
import { signIn } from 'next-auth/react';
import { Button, Text, PasswordInput, Stack, TextInput, Divider } from '@mantine/core';
import { IconLogin } from '@tabler/icons-react';
import { useState } from 'react';

export default function LoginForm() {
  const searchParams = useSearchParams();

  const [loading, setLoading] = useState<boolean>(false);
  const [error, setError] = useState<string>('');

  const [email, setEmail] = useState<string>('');
  const [password, setPassword] = useState<string>('');

  const callbackUrl = searchParams.get('callbackUrl') || '/';

  const onSubmit = async (e: React.FormEvent) => {
    e.preventDefault();

    if (!email.length || !password.length) {
      setError('Du måste ange både e-postadress och lösenord');
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
        setError('Ogiltig e-post eller lösenord');
      }
    } catch (err: any) {
      setLoading(false);
      setError(err);
    }
  };

  return (
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
          label="Lösenord"
          placeholder="****"
          onChange={(e) => {
            setPassword(e.currentTarget.value);
          }}
        />
        <Button key="login" leftSection={<IconLogin size={20} />} type="submit" loading={loading}>
          Logga in
        </Button>

        <Divider />

        <Button type="button" onClick={() => signIn('google')}>
          Logga in med Google
        </Button>
      </Stack>
    </form>
  );
}
