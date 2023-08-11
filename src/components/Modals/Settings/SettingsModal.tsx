'use client';

import { Modal, Stack, Tabs } from '@mantine/core';
import { Session } from 'next-auth';
import { useSettingsModal } from '@/hooks/useSettingsModal';
import PasswordForm from './Password/PasswordForm';
import ProfileForm from './Profile/ProfileForm';

interface SettingsModalProps {
  session: Session | null;
}

export default function SettingsModal({ session }: SettingsModalProps) {
  const { opened, handlers } = useSettingsModal();

  return (
    <Modal opened={opened} onClose={handlers.close} title="Inställningar">
      <Tabs defaultValue="profile">
        <Tabs.List>
          <Tabs.Tab value="profile">Profil</Tabs.Tab>
          <Tabs.Tab value="password">Lösenord</Tabs.Tab>
        </Tabs.List>
        <Stack gap="sm" mt="lg">
          <Tabs.Panel value="profile">
            <ProfileForm />
          </Tabs.Panel>
          <Tabs.Panel value="password">
            <PasswordForm session={session} />
          </Tabs.Panel>
        </Stack>
      </Tabs>
    </Modal>
  );
}
