'use client';

import { Modal, Stack, Tabs } from '@mantine/core';
import { useAuthModal } from '@/hooks/useAuthModal';
import LoginForm from './Login/LoginForm';
import SignupForm from './Signup/SignupForm';

export default function AuthModal() {
  const { opened, handlers } = useAuthModal();

  return (
    <Modal opened={opened} onClose={handlers.close}>
      <Tabs defaultValue="login">
        <Tabs.List>
          <Tabs.Tab value="login">Logga in</Tabs.Tab>
          <Tabs.Tab value="signup">Registrera</Tabs.Tab>
        </Tabs.List>
        <Stack gap="sm" mt="lg">
          <Tabs.Panel value="login">
            <LoginForm />
          </Tabs.Panel>
          <Tabs.Panel value="signup">
            <SignupForm />
          </Tabs.Panel>
        </Stack>
      </Tabs>
    </Modal>
  );
}
