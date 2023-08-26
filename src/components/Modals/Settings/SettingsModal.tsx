'use client';

import { Modal, Stack, Tabs } from '@mantine/core';
import { Session } from 'next-auth';
import { useMediaQuery } from '@mantine/hooks';
import { useSettingsModal } from '@/hooks/useSettingsModal';
import PasswordForm from './Password/PasswordForm';
import ProfileForm from './Profile/ProfileForm';
import { useAuthModal } from '@/hooks/useAuthModal';

type SettingsModalProps = {
  session: Session | null;
};

export default function SettingsModal({ session }: SettingsModalProps) {
  const { opened, handlers } = useSettingsModal();
  const { user } = useAuthModal();
  const isMobile = useMediaQuery('(max-width: 800px)');

  return (
    <Modal opened={opened} onClose={handlers.close} title="Inställningar" fullScreen={isMobile}>
      <Tabs defaultValue="profile">
        <Tabs.List>
          <Tabs.Tab value="profile">Profil</Tabs.Tab>
          {!user?.provider && <Tabs.Tab value="password">Lösenord</Tabs.Tab>}
        </Tabs.List>
        <Stack gap="sm" mt="lg">
          <Tabs.Panel value="profile">
            <ProfileForm session={session} />
          </Tabs.Panel>
          {!user?.provider && (
            <Tabs.Panel value="password">
              <PasswordForm session={session} />
            </Tabs.Panel>
          )}
        </Stack>
      </Tabs>
    </Modal>
  );
}
