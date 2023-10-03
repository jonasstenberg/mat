'use client';

import { Button, Divider, Modal, Select, Stack, Text, TextInput } from '@mantine/core';
import { IconDeviceFloppy } from '@tabler/icons-react';
import { useDisclosure } from '@mantine/hooks';
import { useRouter } from 'next/navigation';
import { useState } from 'react';
import { signOut } from 'next-auth/react';
import { Session } from 'next-auth';
import { notifications } from '@mantine/notifications';
import { useForm, zodResolver } from '@mantine/form';
import { deleteUser, updateUser } from '@/actions/user';
import { validateServerResponse } from '@/utils/handleServerErrors';
import { UserProfileSchema, UserSchema, userProfileSchema } from '@/types/user';
import { Result } from '@/utils/result';

type ProfileFormProps = {
  session: Session | null;
  user: Result<UserSchema>;
};

export default function ProfileForm({ session, user }: ProfileFormProps) {
  const [isLoading, setIsLoading] = useState<boolean>(false);
  const [confirmOpened, { open: confirmOpen, close: confirmClose }] = useDisclosure(false);
  const router = useRouter();

  const userData = user.success ? user.value : null;

  const form = useForm<UserProfileSchema>({
    initialValues: userData ?? {
      email: session?.user.email as string,
      name: '',
      measures_system: 'metric',
    },

    validate: zodResolver(userProfileSchema),
  });

  const handleDeleteAccount = async () => {
    if (!userData) {
      return;
    }
    await deleteUser(userData);
    await signOut();
    confirmClose();
    router.push('/');
  };

  const onSubmit = async () => {
    try {
      setIsLoading(true);

      if (!userData) {
        return;
      }

      const response = await updateUser(userData, form.values);
      const isSuccess = validateServerResponse(response);

      if (isSuccess && response.success) {
        notifications.show({
          title: 'Sparat!',
          message: 'Profilen uppdaterad 🙃',
        });
      }
      router.refresh();
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
          <TextInput label="E-post" disabled value={session?.user.email ?? ''} />
          {user ? (
            <TextInput label="Namn" withAsterisk {...form.getInputProps('name')} />
          ) : (
            'Laddar...'
          )}
          <Select
            label="Enhet"
            placeholder="Välj enhet"
            data={[
              { value: 'metric', label: 'Metrisk' },
              { value: 'imperial', label: 'Imperisk' },
            ]}
            {...form.getInputProps('measures_system')}
          />
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
