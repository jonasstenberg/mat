'use client';

import { Avatar, Group, Menu, Text, UnstyledButton, rem } from '@mantine/core';
import { IconChevronDown, IconLogin, IconLogout, IconSettings } from '@tabler/icons-react';
import { Session } from 'next-auth';
import { signOut } from 'next-auth/react';
import { useRouter } from 'next/navigation';
import { useState } from 'react';

import styles from '@/app/header.module.css';
import { useAuthModal } from '@/hooks/useAuthModal';
import { useSettingsModal } from '@/hooks/useSettingsModal';
import { UserSchema } from '@/types/user';
import { Result } from '@/utils/result';

type HeaderMenuProps = {
  session: Session | null;
  user: Result<UserSchema>;
};

export default function HeaderMenu({ session, user }: HeaderMenuProps) {
  const [userMenuOpened, setUserMenuOpened] = useState<boolean>(false);
  const router = useRouter();
  const { handlers: loginHandlers } = useAuthModal();
  const { handlers: settingsHandlers } = useSettingsModal();

  const userName = user.success ? user?.value?.name?.split(' ')[0] || '' : '';

  return (
    <>
      <div className={styles['user-menu']}>
        <Menu
          shadow="md"
          width={200}
          onClose={() => setUserMenuOpened(false)}
          onOpen={() => setUserMenuOpened(true)}
        >
          <Menu.Target>
            <UnstyledButton
              variant="filled"
              p="xs"
              className={styles.user}
              data-active={userMenuOpened}
            >
              <Group gap={7}>
                <Avatar src={session?.user.image} alt={userName} radius="xl" size={20} />
                <Text fw={500} size="lg" style={{ lineHeight: 1 }} mr={3}>
                  {userName}
                </Text>
                <IconChevronDown style={{ width: '0.75rem', height: '0.75rem' }} stroke={1.5} />
              </Group>
            </UnstyledButton>
          </Menu.Target>
          {session?.user.email ? (
            <>
              <Menu.Dropdown key="loggedin">
                <Menu.Item
                  leftSection={<IconSettings style={{ width: rem(14), height: rem(14) }} />}
                  style={{ fontSize: '1rem' }}
                  onClick={() => {
                    settingsHandlers.open();
                  }}
                >
                  Konto
                </Menu.Item>
                <Menu.Item
                  leftSection={<IconLogout style={{ width: rem(14), height: rem(14) }} />}
                  style={{ fontSize: '1rem' }}
                  onClick={async () => {
                    await signOut();
                    router.push('/');
                  }}
                >
                  Logga ut
                </Menu.Item>
              </Menu.Dropdown>
            </>
          ) : (
            <Menu.Dropdown key="login">
              <Menu.Item
                leftSection={<IconLogin style={{ width: rem(14), height: rem(14) }} />}
                style={{ fontSize: '1rem' }}
                onClick={() => {
                  loginHandlers.open();
                }}
              >
                Logga in
              </Menu.Item>
            </Menu.Dropdown>
          )}
        </Menu>
      </div>
    </>
  );
}
