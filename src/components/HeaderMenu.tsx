'use client';

import { IconSquarePlus, IconLogout, IconLogin, IconSettings } from '@tabler/icons-react';
import { signOut } from 'next-auth/react';
import { Session } from 'next-auth';

import { Menu, Button, rem } from '@mantine/core';
import { useRecipeModal } from '@/hooks/useRecipeModal';
import { useAuthModal } from '@/hooks/useAuthModal';
import { useSettingsModal } from '@/hooks/useSettingsModal';

interface HeaderMenuProps {
  session: Session | null;
}

export default function HeaderMenu(props: HeaderMenuProps) {
  const { handlers } = useRecipeModal();
  const { handlers: loginHandlers } = useAuthModal();
  const { handlers: settingsHandlers } = useSettingsModal();
  return (
    <>
      <div style={{ marginRight: rem(16) }}>
        <Menu shadow="md" width={200}>
          <Menu.Target>
            <Button>Meny</Button>
          </Menu.Target>
          {props.session?.user?.name ? (
            <Menu.Dropdown>
              <Menu.Label>{props.session?.user?.email}</Menu.Label>
              <Menu.Label>Tjänster</Menu.Label>
              <Menu.Item
                leftSection={<IconSquarePlus style={{ width: rem(14), height: rem(14) }} />}
                onClick={() => {
                  handlers.open();
                }}
              >
                Lägg till recept
              </Menu.Item>

              <Menu.Divider />

              <Menu.Label>Inställningar</Menu.Label>
              <Menu.Item
                leftSection={<IconSettings style={{ width: rem(14), height: rem(14) }} />}
                onClick={() => {
                  settingsHandlers.open();
                }}
              >
                Inställningar
              </Menu.Item>
              <Menu.Item
                leftSection={<IconLogout style={{ width: rem(14), height: rem(14) }} />}
                onClick={() => {
                  signOut();
                }}
              >
                Logga ut
              </Menu.Item>
            </Menu.Dropdown>
          ) : (
            <Menu.Dropdown>
              <Menu.Label>Auth</Menu.Label>
              <Menu.Item
                leftSection={<IconLogin style={{ width: rem(14), height: rem(14) }} />}
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
