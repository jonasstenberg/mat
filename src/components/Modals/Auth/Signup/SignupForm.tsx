'use client';

import { useSearchParams } from 'next/navigation';
import { signIn } from 'next-auth/react';
import { Button, Text, PasswordInput, Stack, TextInput, Divider } from '@mantine/core';
import { IconUserPlus, IconBrandGoogle } from '@tabler/icons-react';
import { useState } from 'react';

const baseUrl = process.env.NEXT_PUBLIC_BASE_URL;

export default function SignupForm() {
  const searchParams = useSearchParams();

  const [loading, setLoading] = useState<boolean>(false);
  const [error, setError] = useState<string>('');

  const [name, setName] = useState<string>('');
  const [email, setEmail] = useState<string>('');
  const [password, setPassword] = useState<string>('');

  const callbackUrl = searchParams.get('callbackUrl') || '/';

  const onSubmit = async (e: React.FormEvent) => {
    e.preventDefault();

    if (!name.length || !email.length || !password.length) {
      setError('Du måste ange både namn, e-postadress och lösenord');
      return;
    }
    try {
      setLoading(true);

      await fetch(`${baseUrl}/api/user`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          name,
          email,
          password,
        }),
      });

      const res = await signIn('credentials', {
        redirect: false,
        email,
        password,
        callbackUrl,
      });

      setLoading(false);

      if (!res?.error) {
        setName('');
        setEmail('');
        setPassword('');
        setError('');
        window.location.reload();
      } else {
        setError('Något gick fel. Försök igen senare.');
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
          label="Name"
          placeholder="Jonas"
          withAsterisk
          onChange={(e) => {
            setName(e.currentTarget.value);
          }}
        />
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
          withAsterisk
          onChange={(e) => {
            setPassword(e.currentTarget.value);
          }}
        />
        <Button
          key="register"
          leftSection={<IconUserPlus size={20} />}
          type="submit"
          loading={loading}
        >
          Registrera
        </Button>

        <Divider />

        <Button
          type="button"
          leftSection={<IconBrandGoogle size={20} />}
          onClick={() => signIn('google')}
        >
          Logga in med Google
        </Button>
      </Stack>
    </form>
  );
}
