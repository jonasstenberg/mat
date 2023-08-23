'use client';

import { useDisclosure } from '@mantine/hooks';
import { Button, Modal } from '@mantine/core';
import { useRouter } from 'next/navigation';
import { notifications } from '@mantine/notifications';

import styles from '@/app/page.module.css';
import { RecipeSchema } from '@/types/recipe';
import { useRecipeModal } from '@/hooks/useRecipeModal';
import { deleteRecipe } from '@/actions/recipe';

type RecipeActionsProps = {
  recipe: RecipeSchema | null;
};

export default function RecipeActions({ recipe }: RecipeActionsProps) {
  const { setRecipeToUpdate, handlers } = useRecipeModal();
  const [confirmOpened, { open: confirmOpen, close: confirmClose }] = useDisclosure(false);
  const router = useRouter();

  const handleDeleteRecipe = async () => {
    await deleteRecipe(recipe?.id as string);
    notifications.show({
      title: '💀',
      message: 'Receptet borttaget!',
    });
    confirmClose();
    router.push('/');
  };

  return (
    <>
      <Modal opened={confirmOpened} onClose={confirmClose} title="Är du säker?" ta="right">
        <Button data-autofocus onClick={confirmClose}>
          Avbryt
        </Button>
        <Button ml="xs" color="red" onClick={handleDeleteRecipe}>
          Ta bort
        </Button>
      </Modal>
      <div className={styles['recipe-actions']}>
        <Button
          onClick={() => {
            setRecipeToUpdate(recipe);
            handlers.open();
          }}
        >
          Redigera
        </Button>
        <Button ml="xs" color="red" onClick={() => confirmOpen()}>
          Ta bort
        </Button>
      </div>
    </>
  );
}
