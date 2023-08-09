'use client';

import { useDisclosure } from '@mantine/hooks';
import { Button, Modal } from '@mantine/core';
import { useRouter } from 'next/navigation';

import { RecipeProps } from '@/types/recipe';
import { useRecipeModal } from '@/hooks/useRecipeModal';

const baseUrl = process.env.NEXT_PUBLIC_BASE_URL;

interface RecipeActionsProps {
  recipe?: RecipeProps | null;
}

export default function RecipeActions({ recipe }: RecipeActionsProps) {
  const { setRecipeToUpdate, handlers } = useRecipeModal();
  const [confirmOpened, { open: confirmOpen, close: confirmClose }] = useDisclosure(false);
  const router = useRouter();

  const handleDeleteRecipe = async () => {
    await fetch(`${baseUrl}/api/recipe?id=${recipe?.id}`, {
      method: 'DELETE',
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
    </>
  );
}
