'use client';

import { IconLogout, IconLogin, IconSettings, IconChevronDown } from '@tabler/icons-react';
import { signOut } from 'next-auth/react';
import { Session } from 'next-auth';
import { Menu, rem, Text, UnstyledButton, Group, Avatar } from '@mantine/core';
import { useRouter } from 'next/navigation';

import { useEffect, useState } from 'react';
import styles from '@/app/header.module.css';
import { useAuthModal } from '@/hooks/useAuthModal';
import { useSettingsModal } from '@/hooks/useSettingsModal';
import { getUser } from '@/actions/user';
import { handleServerErrors } from '@/utils/handleServerErrors';
import { UserSchema } from '@/types/user';

type HeaderMenuProps = {
  session: Session | null;
};

export default function HeaderMenu({ session }: HeaderMenuProps) {
  const [userMenuOpened, setUserMenuOpened] = useState<boolean>(false);
  const router = useRouter();
  const { handlers: loginHandlers } = useAuthModal();
  const { handlers: settingsHandlers } = useSettingsModal();
  const { user, setUser } = useAuthModal();

  useEffect(() => {
    const fetchData = async () => {
      if (!session?.user.email) {
        return;
      }

      const response = await getUser(session?.user.email);
      const isSuccess = await handleServerErrors(response);

      if (isSuccess) {
        setUser(response.success?.user as UserSchema);
      }
    };

    fetchData();
  }, [session?.user.email]);

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
                <Avatar src={session?.user.image} alt={user?.name || ''} radius="xl" size={20} />
                <Text fw={500} size="lg" style={{ lineHeight: 1 }} mr={3}>
                  {user?.name?.split(' ')[0] || ''}
                </Text>
                <IconChevronDown size="0.75rem" stroke={1.5} />
              </Group>
            </UnstyledButton>
          </Menu.Target>
          {session?.user.email ? (
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
                onClick={() => {
                  signOut();
                  router.push('/');
                }}
              >
                Logga ut
              </Menu.Item>
            </Menu.Dropdown>
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
