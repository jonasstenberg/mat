'use client';

import { Button, PasswordInput, Stack } from '@mantine/core';
import { useForm, zodResolver } from '@mantine/form';
import { IconDeviceFloppy } from '@tabler/icons-react';
import { useState } from 'react';
import { useRouter } from 'next/navigation';
import { Session } from 'next-auth';
import { notifications } from '@mantine/notifications';
import { PasswordChangeSchema, passwordChangeSchema } from '@/types/user';
import { resetPassword } from '@/actions/user';
import { validateServerResponse } from '@/utils/handleServerErrors';

type PasswordFormProps = {
  session: Session | null;
};

export default function PasswordForm({ session }: PasswordFormProps) {
  const [isLoading, setIsLoading] = useState<boolean>(false);
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
      setIsLoading(true);

      const response = await resetPassword(form.values);
      const isSuccess = validateServerResponse(response, form);

      if (isSuccess) {
        notifications.show({
          title: 'Sparat!',
          message: 'Lösenordet uppdaterat 👌',
        });
        form.reset();
        router.refresh();
      }

      setIsLoading(false);
    } catch (err: any) {
      setIsLoading(false);
    }
  };

  return (
    <form onSubmit={form.onSubmit(() => onSubmit())}>
      <Stack gap="sm">
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
        <Button leftSection={<IconDeviceFloppy size={20} />} type="submit" loading={isLoading}>
          Spara
        </Button>
      </Stack>
    </form>
  );
}
