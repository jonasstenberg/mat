import { Button, PasswordInput, Stack, Text } from '@mantine/core';
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

const requirements = `Lösenordskrav:
- Minst 8 tecken i längd.
- Innehåller minst en stor bokstav.
- Innehåller minst en liten bokstav.
- Innehåller minst en siffra.`;

export default function PasswordForm({ session }: PasswordFormProps) {
  const [loading, setLoading] = useState<boolean>(false);
  const [error, setError] = useState<string>('');

  const [oldPassword, setOldPassword] = useState<string>('');
  const [newPassword1, setNewPassword1] = useState<string>('');
  const [newPassword2, setNewPassword2] = useState<string>('');

  const onSubmit = async (e: React.FormEvent) => {
    e.preventDefault();

    if (!oldPassword.length || !newPassword1.length || !newPassword2.length) {
      setError('Du kan inte lämna något fält tomt');
      return;
    }

    if (newPassword1 !== newPassword2) {
      setError('Lösenorden stämmer inte överens');
      return;
    }

    if (!isValidPassword(newPassword1)) {
      setError(requirements);
      return;
    }

    try {
      setLoading(true);

      const res = await fetch(`${baseUrl}/api/user`, {
        method: 'PUT',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          email: session?.user?.email,
          old_password: oldPassword,
          new_password: newPassword1,
        }),
      });

      setLoading(false);

      if (res.ok) {
        setOldPassword('');
        setNewPassword1('');
        setNewPassword2('');
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
    <form onSubmit={onSubmit}>
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
          value={oldPassword}
          onChange={(e) => setOldPassword(e.currentTarget.value)}
        />
        <PasswordInput
          label="Nytt lösenord"
          autoComplete="new-password"
          value={newPassword1}
          onChange={(e) => setNewPassword1(e.currentTarget.value)}
        />
        <PasswordInput
          label="Upprepa nytt lösenord"
          autoComplete="new-password"
          value={newPassword2}
          onChange={(e) => setNewPassword2(e.currentTarget.value)}
        />
        <Button leftSection={<IconDeviceFloppy size={20} />} type="submit" loading={loading}>
          Spara
        </Button>
      </Stack>
    </form>
  );
}
