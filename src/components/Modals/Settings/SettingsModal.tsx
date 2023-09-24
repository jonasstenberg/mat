'use client';

import { Modal, Stack, Tabs } from '@mantine/core';
import { Session } from 'next-auth';
import { useMediaQuery } from '@mantine/hooks';
import { useSettingsModal } from '@/hooks/useSettingsModal';
import PasswordForm from './Password/PasswordForm';
import ProfileForm from './Profile/ProfileForm';
import { UserSchema } from '@/types/user';
import { Result } from '@/utils/result';

type SettingsModalProps = {
  session: Session | null;
  user: Result<UserSchema>;
};

export default function SettingsModal({ user, session }: SettingsModalProps) {
  const { opened, handlers } = useSettingsModal();
  const isMobile = useMediaQuery('(max-width: 832px)');
  const userProvider = user.success ? user?.value?.provider : null;

  return (
    <Modal opened={opened} onClose={handlers.close} title="Inställningar" fullScreen={isMobile}>
      <Tabs defaultValue="profile">
        <Tabs.List>
          <Tabs.Tab value="profile">Profil</Tabs.Tab>
          {!userProvider && <Tabs.Tab value="password">Lösenord</Tabs.Tab>}
        </Tabs.List>
        <Stack gap="sm" mt="lg">
          <Tabs.Panel value="profile">
            <ProfileForm session={session} user={user} />
          </Tabs.Panel>
          {!userProvider && (
            <Tabs.Panel value="password">
              <PasswordForm session={session} />
            </Tabs.Panel>
          )}
        </Stack>
      </Tabs>
    </Modal>
  );
}
