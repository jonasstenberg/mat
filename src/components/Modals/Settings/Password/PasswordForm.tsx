import { Button, PasswordInput, Stack, Text } from '@mantine/core';
import { hasLength, matchesField, useForm } from '@mantine/form';
import { IconDeviceFloppy } from '@tabler/icons-react';
import { Session } from 'next-auth';
import { useState } from 'react';

const baseUrl = process.env.NEXT_PUBLIC_BASE_URL;

interface PasswordFormProps {
  session: Session | null;
}

const isValidPassword = (password: string): boolean => {
  const minLength = 8;

  if (password.length < minLength) {
    return false;
  }

  if (!(password.match(/[A-Z]/) && password.match(/[a-z]/))) {
    return false;
  }

  if (!password.match(/\d/)) {
    return false;
  }

  return true;
};

const requirements =
  'Lösenordet måste innehålla minst 8 tecken, minst en stor bokstav, minst en liten bokstav och minst en siffra.';

export default function PasswordForm({ session }: PasswordFormProps) {
  const [loading, setLoading] = useState<boolean>(false);
  const [error, setError] = useState<string>('');

  const form = useForm({
    initialValues: {
      oldPassword: '',
      newPassword1: '',
      newPassword2: '',
    },

    validate: {
      oldPassword: hasLength({ min: 8 }, requirements),
      newPassword1: (val) => (!isValidPassword(val) ? requirements : null),
      newPassword2: matchesField('newPassword1', 'Lösenorden stämmer inte överens'),
    },
  });

  const onSubmit = async () => {
    try {
      setLoading(true);

      const res = await fetch(`${baseUrl}/api/user`, {
        method: 'PUT',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          email: session?.user?.email,
          old_password: form.values.oldPassword,
          new_password: form.values.newPassword1,
        }),
      });

      setLoading(false);

      if (res.ok) {
        setError('');
        window.location.reload();
      } else {
        const msg = await res.json();
        switch (msg.error) {
          case 'incorrect-old-password':
            setError('Ditt gamla lösenord stämmer inte');
            break;
          case 'not-meet-requirements':
            setError(requirements);
            break;
          default:
            setError('Något gick fel. Försök igen senare.');
            break;
        }
      }
    } catch (err: any) {
      setLoading(false);
      setError(err);
    }
  };

  return (
    <form onSubmit={form.onSubmit(() => onSubmit())}>
      <Stack gap="sm">
        {error && (
          <Text c="red" size="xs" style={{ whiteSpace: 'pre-line' }}>
            {error}
          </Text>
        )}
        <PasswordInput
          label="Gammalt lösenord"
          autoComplete="current-password"
          data-autofocus
          withAsterisk
          {...form.getInputProps('oldPassword')}
        />
        <PasswordInput
          label="Nytt lösenord"
          autoComplete="new-password"
          withAsterisk
          {...form.getInputProps('newPassword1')}
        />
        <PasswordInput
          label="Upprepa nytt lösenord"
          autoComplete="new-password"
          withAsterisk
          {...form.getInputProps('newPassword2')}
        />
        <Button leftSection={<IconDeviceFloppy size={20} />} type="submit" loading={loading}>
          Spara
        </Button>
      </Stack>
    </form>
  );
}
