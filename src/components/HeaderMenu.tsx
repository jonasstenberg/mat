'use client';

import {
  IconSquarePlus,
  IconLogout,
  IconLogin,
  IconSettings,
  IconChevronDown,
} from '@tabler/icons-react';
import { signOut } from 'next-auth/react';
import { Session } from 'next-auth';
import { Menu, rem, Text, UnstyledButton, Group, Avatar } from '@mantine/core';

import { useEffect, useRef, useState } from 'react';
import styles from '@/app/header.module.css';
import { useRecipeModal } from '@/hooks/useRecipeModal';
import { useAuthModal } from '@/hooks/useAuthModal';
import { useSettingsModal } from '@/hooks/useSettingsModal';
import { getUser } from '@/actions/user';
import { handleServerErrors } from '@/utils/handleServerErrors';
import { UserSchema } from '@/types/user';

type HeaderMenuProps = {
  session: Session | null;
};

export default function HeaderMenu({ session }: HeaderMenuProps) {
  const { handlers } = useRecipeModal();
  const [userMenuOpened, setUserMenuOpened] = useState<boolean>(false);
  const { handlers: loginHandlers } = useAuthModal();
  const { handlers: settingsHandlers } = useSettingsModal();
  const { user, setUser } = useAuthModal();
  const emailRef = useRef<string | null>(null);

  useEffect(() => {
    const fetchData = async () => {
      if (!session?.user.email || emailRef.current) {
        return;
      }

      emailRef.current = session?.user.email;

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
      <div style={{ marginRight: rem(16) }}>
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
          {user?.name ? (
            <Menu.Dropdown>
              <Menu.Item
                leftSection={<IconSquarePlus style={{ width: rem(14), height: rem(14) }} />}
                style={{ fontSize: '1rem' }}
                onClick={() => {
                  handlers.open();
                }}
              >
                Lägg till recept
              </Menu.Item>

              <Menu.Divider />

              <Menu.Label style={{ fontSize: '1rem' }}>Inställningar</Menu.Label>
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
                }}
              >
                Logga ut
              </Menu.Item>
            </Menu.Dropdown>
          ) : (
            <Menu.Dropdown>
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
