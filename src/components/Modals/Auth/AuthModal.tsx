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
import { useRouter, useSearchParams } from 'next/navigation';
import { useForm, zodResolver } from '@mantine/form';
import { useState } from 'react';
import { signIn } from 'next-auth/react';
import { useAuthModal } from '@/hooks/useAuthModal';
import { GoogleButton } from '@/components/SocialButtons';
import { capitalizeFirstLetter } from '@/utils/strings';
import { SignInSchema, SignUpSchema, signInSchema, signUpSchema } from '@/types/user';
import { signUp } from '@/actions/user';
import { handleServerErrors } from '@/utils/handleServerErrors';

export default function AuthModal() {
  const router = useRouter();
  const searchParams = useSearchParams();
  const { opened, handlers } = useAuthModal();
  const [type, toggle] = useToggle(['login', 'register']);
  const [loading, setLoading] = useState<boolean>(false);
  const [error, setError] = useState<string>('');

  const callbackUrl = searchParams.get('callbackUrl') || '/';

  const form = useForm<SignUpSchema | SignInSchema>({
    initialValues: {
      email: '',
      name: '',
      password: '',
    },

    validate: zodResolver(type === 'login' ? signInSchema : signUpSchema),
  });

  const onSubmit = async (values: SignUpSchema | SignInSchema) => {
    try {
      setLoading(true);

      if (type === 'register') {
        const signUpResponse = await signUp(values as SignUpSchema);
        const isSuccess = await handleServerErrors(signUpResponse, form);

        if (!isSuccess) {
          setLoading(false);
          return;
        }
      }
      const signInResponse = await signIn('credentials', {
        redirect: false,
        email: values.email,
        password: values.password,
        callbackUrl,
      });

      setLoading(false);

      if (signInResponse?.error) {
        setError('Ogiltig e-post eller lösenord');
      } else {
        form.reset();
        handlers.close();
        router.refresh();
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
