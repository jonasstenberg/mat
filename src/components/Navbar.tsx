'use client';

import { Session } from 'next-auth';
import dynamic from 'next/dynamic';
import Link from 'next/link';
import { usePathname, useRouter } from 'next/navigation';
import { useDisclosure, useMediaQuery } from '@mantine/hooks';
import clsx from 'clsx';
import { Burger, Divider, Drawer } from '@mantine/core';

import { signOut } from 'next-auth/react';
import styles from '../app/header.module.css';
import { useAuthModal } from '@/hooks/useAuthModal';
import { useSettingsModal } from '@/hooks/useSettingsModal';
import { UserSchema } from '@/types/user';

const HeaderMenu = dynamic(() => import('@/components/HeaderMenu'), {
  loading: () => <p />,
  ssr: false,
});

type MenuProps = {
  session: Session | null;
  user: UserSchema | null | undefined;
};

export default function Navbar({ session, user }: MenuProps) {
  const pathname = usePathname();
  const router = useRouter();
  const [opened, { toggle, close }] = useDisclosure();
  const { handlers: loginHandlers } = useAuthModal();
  const { handlers: settingsHandlers } = useSettingsModal();

  const small = useMediaQuery('(min-width: 768px)');

  if (small) {
    return (
      <>
        <nav className={styles.nav}>
          <ul>
            <li>
              <Link href="/" className={clsx(pathname === '/' ? styles['nav-current'] : '')}>
                {session?.user.email ? 'Mitt' : 'Alla recept'}
              </Link>
            </li>
            {session?.user.email ? (
              <li>
                <Link
                  href="/all"
                  className={clsx(pathname === '/all' ? styles['nav-current'] : '')}
                >
                  Alla recept
                </Link>
              </li>
            ) : (
              ''
            )}
          </ul>
        </nav>
        <HeaderMenu session={session} user={user} />
      </>
    );
  }

  return (
    <>
      <Burger
        opened={opened}
        className={styles.burger}
        onClick={(e) => {
          e.preventDefault();
          toggle();
        }}
        aria-label="Toggla menyn"
      />
      <Drawer opened={opened} onClose={close} size="100%" className={styles.drawer}>
        {session?.user.email ? (
          <>
            <Link
              href="#"
              onClick={() => {
                toggle();
                settingsHandlers.open();
              }}
            >
              Konto
            </Link>
            <Link
              href="#"
              type="button"
              onClick={async () => {
                toggle();
                signOut();
                router.push('/');
              }}
            >
              Logga ut
            </Link>

            <Divider />
          </>
        ) : (
          <Link
            href="#"
            type="button"
            onClick={async () => {
              toggle();
              loginHandlers.open();
            }}
          >
            Logga in
          </Link>
        )}
        <Link
          onClick={() => toggle()}
          href="/"
          className={clsx(pathname === '/' ? styles['nav-current'] : '')}
        >
          {session?.user.email ? 'Mina recept' : 'Alla recept'}
        </Link>
        {session?.user.email ? (
          <Link
            onClick={() => toggle()}
            href="/all"
            className={clsx(pathname === '/all' ? styles['nav-current'] : '')}
          >
            Alla recept
          </Link>
        ) : (
          ''
        )}
      </Drawer>
    </>
  );
}
