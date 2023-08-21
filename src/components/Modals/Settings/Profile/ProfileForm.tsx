'use client';

import { Button, Divider, Modal, Stack, Text, TextInput } from '@mantine/core';
import { IconDeviceFloppy } from '@tabler/icons-react';
import { useDisclosure } from '@mantine/hooks';
import { useRouter } from 'next/navigation';
import { useEffect, useState } from 'react';
import { signOut } from 'next-auth/react';
import { Session } from 'next-auth';
import { useAuthModal } from '@/hooks/useAuthModal';
import { deleteUser, getUser, updateUser } from '@/actions/user';

export default function ProfileForm({ session }: { session: Session | null }) {
  const [loading, setLoading] = useState<boolean>(false);
  const [error, setError] = useState<string>('');
  const [success, setSuccess] = useState<boolean>(false);
  const [confirmOpened, { open: confirmOpen, close: confirmClose }] = useDisclosure(false);
  const router = useRouter();
  const [name, setName] = useState<string>('');
  const { user, setUser } = useAuthModal();

  useEffect(() => {
    const fetchData = async () => {
      if (!session?.user.email) {
        return;
      }
      const u = await getUser(session?.user.email);
      if (u) {
        setUser(u);
        setName(u.name);
      }
    };

    fetchData();
  }, []);

  const handleDeleteAccount = async () => {
    if (!user) {
      return;
    }
    await deleteUser(user);
    await signOut();
    confirmClose();
    router.push('/');
  };

  const onSubmit = async (e: React.FormEvent) => {
    e.preventDefault();

    if (!name.length) {
      setError('Du måste ange ett namn');
      return;
    }

    try {
      setLoading(true);

      if (!user) {
        return;
      }
      const message = await updateUser(user, name);

      setLoading(false);

      if (message.length) {
        throw new Error(message);
      }

      setError('');
      setSuccess(true);
    } catch (err: any) {
      setLoading(false);
      setError(err);
    }
  };

  return (
    <>
      <Modal opened={confirmOpened} onClose={confirmClose} title="Är du säker?" ta="right" centered>
        <Button data-autofocus onClick={confirmClose}>
          Avbryt
        </Button>
        <Button ml="xs" color="red" onClick={handleDeleteAccount}>
          Ta bort mitt konto
        </Button>
      </Modal>
      <form onSubmit={onSubmit}>
        <Stack gap="sm">
          {success && (
            <Text c="green" size="xs" style={{ whiteSpace: 'pre-line' }}>
              Uppdaterat!
            </Text>
          )}
          {error && (
            <Text c="red" size="xs" style={{ whiteSpace: 'pre-line' }}>
              {error}
            </Text>
          )}
          <TextInput
            label="Namn"
            withAsterisk
            value={name}
            onChange={(e) => setName(e.currentTarget.value)}
          />
          <Button leftSection={<IconDeviceFloppy size={20} />} type="submit" loading={loading}>
            Spara
          </Button>
          <Divider />
          <Text>Om du tar bort ditt konto kommer alla dina recept att tas bort också.</Text>
          <Button color="red" onClick={() => confirmOpen()}>
            Ta bort mitt konto
          </Button>
        </Stack>
      </form>
    </>
  );
}
