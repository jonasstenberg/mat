import { Button, PasswordInput, Stack, Text } from '@mantine/core';
import { useForm, zodResolver } from '@mantine/form';
import { IconDeviceFloppy } from '@tabler/icons-react';
import { useState } from 'react';
import { useRouter } from 'next/navigation';
import { Session } from 'next-auth';
import { PasswordChangeSchema, passwordChangeSchema } from '@/types/user';
import { resetPassword } from '@/actions/user';

export default function PasswordForm({ session }: { session: Session | null }) {
  const [loading, setLoading] = useState<boolean>(false);
  const [error, setError] = useState<string>('');
  const [success, setSuccess] = useState<boolean>(false);
  const router = useRouter();

  const form = useForm<PasswordChangeSchema>({
    initialValues: {
      email: session?.user.email as string,
      oldPassword: '',
      password: '',
      confirmPassword: '',
    },

    validate: zodResolver(passwordChangeSchema),
  });

  const onSubmit = async () => {
    try {
      setLoading(true);

      const msg = await resetPassword(form.values);

      setLoading(false);

      if (!msg.error.length) {
        setError('');
        setSuccess(true);
        form.reset();
        router.refresh();
        return;
      }

      switch (msg.error) {
        case 'incorrect-old-password':
          form.setFieldError('oldPassword', 'Ditt gamla lösenord stämmer inte');
          break;
        case 'not-meet-requirements':
          form.setFieldError(
            'password',
            'Lösenordet måste innehålla minst 8 tecken, minst en stor bokstav, minst en liten bokstav och minst en siffra.'
          );
          break;
        default:
          form.setFieldError('password', 'Något gick fel. Försök igen senare.');
          break;
      }
    } catch (err: any) {
      setLoading(false);
      setError(err);
    }
  };

  return (
    <form onSubmit={form.onSubmit(() => onSubmit())}>
      <Stack gap="sm">
        {success && (
          <Text c="green" size="xs" style={{ whiteSpace: 'pre-line' }}>
            Lösenordet bytt!
          </Text>
        )}
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
          {...form.getInputProps('password')}
        />
        <PasswordInput
          label="Upprepa nytt lösenord"
          autoComplete="new-password"
          withAsterisk
          {...form.getInputProps('confirmPassword')}
        />
        <Button leftSection={<IconDeviceFloppy size={20} />} type="submit" loading={loading}>
          Spara
        </Button>
      </Stack>
    </form>
  );
}
