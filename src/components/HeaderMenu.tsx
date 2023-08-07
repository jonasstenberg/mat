'use client';

import { IconSquarePlus, IconLogout } from '@tabler/icons-react';
import { signOut } from 'next-auth/react';
import { Session } from 'next-auth';

import { Menu, Button, rem } from '@mantine/core';
import { useRecipeDrawer } from '@/hooks/useRecipeDrawer';
import { useLoginDrawer } from '@/hooks/useLoginDrawer';

interface HeaderMenuProps {
  session: Session | null;
}

export default function HeaderMenu(props: HeaderMenuProps) {
  const { handlers } = useRecipeDrawer();
  const { handlers: loginHandlers } = useLoginDrawer();
  return (
    <>
      <div style={{ marginRight: rem(16) }}>
        <Menu shadow="md" width={200}>
          <Menu.Target>
            <Button>Meny</Button>
          </Menu.Target>
          {props.session?.user?.name ? (
            <Menu.Dropdown>
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
              <Menu.Label>User</Menu.Label>
              <Menu.Item
                leftSection={<IconLogout style={{ width: rem(14), height: rem(14) }} />}
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
