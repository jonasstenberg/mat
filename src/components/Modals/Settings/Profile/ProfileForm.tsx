'use client';

import { Button, Divider, Modal, Stack, Text, TextInput } from '@mantine/core';
import { IconDeviceFloppy } from '@tabler/icons-react';
import { useDisclosure } from '@mantine/hooks';
import { useRouter } from 'next/navigation';
import { useState } from 'react';
import { signOut } from 'next-auth/react';
import { Session } from 'next-auth';
import { notifications } from '@mantine/notifications';
import { useForm, zodResolver } from '@mantine/form';
import { useAuthModal } from '@/hooks/useAuthModal';
import { deleteUser, updateUser } from '@/actions/user';
import { handleServerErrors } from '@/utils/handleServerErrors';
import { UserNameSchema, userNameSchema } from '@/types/user';

export default function ProfileForm({ session }: { session: Session | null }) {
  const [isLoading, setIsLoading] = useState<boolean>(false);
  const [confirmOpened, { open: confirmOpen, close: confirmClose }] = useDisclosure(false);
  const router = useRouter();
  const { user, setUser } = useAuthModal();

  const form = useForm<UserNameSchema>({
    initialValues: user ?? {
      email: session?.user.email as string,
      name: '',
    },

    validate: zodResolver(userNameSchema),
  });

  const handleDeleteAccount = async () => {
    if (!user) {
      return;
    }
    await deleteUser(user);
    await signOut();
    confirmClose();
    router.push('/');
  };

  const onSubmit = async () => {
    try {
      setIsLoading(true);

      if (!user) {
        return;
      }
      const response = await updateUser(user, form.values);
      const isSuccess = await handleServerErrors(response);

      if (isSuccess && response.success?.user) {
        setUser(response.success?.user);
        notifications.show({
          title: 'Sparat!',
          message: 'Namnet uppdaterat 🙃',
        });
      }
      setIsLoading(false);
    } catch (err: unknown) {
      setIsLoading(false);
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
      <form onSubmit={form.onSubmit(() => onSubmit())}>
        <Stack gap="sm">
          {user ? (
            <TextInput label="Namn" withAsterisk {...form.getInputProps('name')} />
          ) : (
            'Laddar...'
          )}
          <Button leftSection={<IconDeviceFloppy size={20} />} type="submit" loading={isLoading}>
            Spara
          </Button>
          <Divider />
          <Text>Om du tar bort ditt konto kommer också alla dina recept att tas bort.</Text>
          <Button color="red" onClick={() => confirmOpen()}>
            Ta bort mitt konto
          </Button>
        </Stack>
      </form>
    </>
  );
}
