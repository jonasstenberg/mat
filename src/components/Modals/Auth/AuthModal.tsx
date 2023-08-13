'use client';

import {
  Anchor,
  Button,
  Divider,
  Group,
  Modal,
  PasswordInput,
  Stack,
  Text,
  TextInput,
} from '@mantine/core';
import { IconLogin } from '@tabler/icons-react';
import { useToggle } from '@mantine/hooks';
import { useSearchParams } from 'next/navigation';
import { isEmail, useForm } from '@mantine/form';
import { useState } from 'react';
import { signIn } from 'next-auth/react';
import { useAuthModal } from '@/hooks/useAuthModal';
import { GoogleButton } from '@/components/SocialButtons';
import { capitalizeFirstLetter } from '@/utils/strings';

const baseUrl = process.env.NEXT_PUBLIC_BASE_URL;

export default function AuthModal() {
  const searchParams = useSearchParams();
  const { opened, handlers } = useAuthModal();
  const [type, toggle] = useToggle(['login', 'register']);
  const [loading, setLoading] = useState<boolean>(false);
  const [error, setError] = useState<string>('');

  const callbackUrl = searchParams.get('callbackUrl') || '/';

  const form = useForm({
    initialValues: {
      email: '',
      name: '',
      password: '',
    },

    validate: {
      email: isEmail('Ogiltig e-post'),
      password: (val) => (val.length <= 8 ? 'Lösenordet måste innehålla minst 8 tecken' : null),
    },
  });

  const onSubmit = async (values: typeof form.values) => {
    try {
      setLoading(true);

      if (type === 'register') {
        await fetch(`${baseUrl}/api/user`, {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({
            name: values.name,
            email: values.email,
            password: values.password,
          }),
        });
      }
      const res = await signIn('credentials', {
        redirect: false,
        email: values.email,
        password: values.password,
        callbackUrl,
      });

      setLoading(false);

      if (res?.error) {
        setError('Ogiltig e-post eller lösenord');
      } else {
        form.reset();
        window.location.reload();
      }
    } catch (err: any) {
      setLoading(false);
      setError(err);
    }
  };

  return (
    <Modal
      opened={opened}
      onClose={handlers.close}
      radius="md"
      title="Välkommen till Receptbanken, logga in med"
    >
      <Group grow mb="md" mt="md">
        <GoogleButton
          onClick={() => signIn('google')}
          style={{
            backgroundColor: '#fff',
            border: '0.0625rem solid rgb(206, 212, 218)',
            color: '#000',
          }}
        >
          Google
        </GoogleButton>
      </Group>

      <Divider my="xs" label="Eller fortsätt med e-post" labelPosition="center" />

      <form onSubmit={form.onSubmit((values) => onSubmit(values))}>
        <Stack>
          {error && (
            <Text c="red" size="xs">
              {error}
            </Text>
          )}
          {type === 'register' && (
            <TextInput
              label="Namn"
              placeholder="Ditt namn"
              withAsterisk
              {...form.getInputProps('name')}
            />
          )}
          <TextInput
            label="E-post"
            placeholder="example@example.com"
            withAsterisk
            {...form.getInputProps('email')}
          />
          <PasswordInput
            label="Lösenord"
            placeholder="****"
            withAsterisk
            {...form.getInputProps('password')}
          />
          <Group mt="md" justify="space-between">
            <Anchor component="button" type="button" c="dimmed" onClick={() => toggle()} size="xs">
              {type === 'register'
                ? 'Har du redan ett konto? Logga in'
                : 'Har du inget konto? Registrera'}
            </Anchor>
            <Button
              key="login"
              leftSection={<IconLogin size={20} />}
              type="submit"
              loading={loading}
            >
              {capitalizeFirstLetter(type)}
            </Button>
          </Group>
        </Stack>
      </form>
    </Modal>
  );
}
