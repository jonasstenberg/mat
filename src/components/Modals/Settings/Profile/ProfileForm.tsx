import { Button, Divider, Modal, Stack, Text, TextInput } from '@mantine/core';
import { IconDeviceFloppy } from '@tabler/icons-react';
import { useDisclosure } from '@mantine/hooks';
import { useRouter } from 'next/navigation';
import { useEffect, useState } from 'react';
import { signOut } from 'next-auth/react';
import { useAuthModal } from '@/hooks/useAuthModal';

const baseUrl = process.env.NEXT_PUBLIC_BASE_URL;

export default function ProfileForm() {
  const [loading, setLoading] = useState<boolean>(false);
  const [error, setError] = useState<string>('');
  const [confirmOpened, { open: confirmOpen, close: confirmClose }] = useDisclosure(false);
  const router = useRouter();
  const [name, setName] = useState<string>('');
  const { user, setUser } = useAuthModal();

  useEffect(() => {
    fetch(`${baseUrl}/api/profile`)
      .then((res) => res.json())
      .then((json) => {
        setUser(json[0]);
        setName(json[0].name);
      });
  }, []);

  const handleDeleteAccount = async () => {
    await fetch(`${baseUrl}/api/user`, {
      method: 'DELETE',
    });
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

      const res = await fetch(`${baseUrl}/api/profile`, {
        method: 'PUT',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          id: user?.id,
          email: user?.email,
          name,
        }),
      });

      setLoading(false);

      if (res.ok) {
        window.location.reload();
      } else {
        throw new Error(`Response not ok ${res.status} ${res.statusText}`);
      }
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
