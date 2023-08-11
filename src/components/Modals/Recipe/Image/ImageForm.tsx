import { Button, Group, Image, Stack, Text, rem } from '@mantine/core';
import { Dropzone, IMAGE_MIME_TYPE } from '@mantine/dropzone';
import { IconDeviceFloppy, IconPhoto } from '@tabler/icons-react';

import { useRecipeModal } from '@/hooks/useRecipeModal';

export default function ImageForm() {
  const { recipeFormData, setRecipeFormData } = useRecipeModal();

  return (
    <Stack gap="sm">
      <Dropzone
        onDrop={(files) => {
          setRecipeFormData({
            ...recipeFormData,
            image: files[0],
          });
        }}
        onReject={(files) => console.log('rejected files', files)}
        maxSize={5 * 1024 ** 2}
        accept={IMAGE_MIME_TYPE}
      >
        <Group justify="center" gap="xl" mih={220} style={{ pointerEvents: 'none' }}>
          {recipeFormData?.image ? (
            <Image
              h={200}
              w="auto"
              fit="cover"
              src={
                typeof recipeFormData.image === 'string'
                  ? `/api/image?filename=${recipeFormData.image}`
                  : URL.createObjectURL(recipeFormData.image)
              }
              alt="Förhandsgranskning"
            />
          ) : (
            <>
              <IconPhoto
                style={{
                  width: rem(52),
                  height: rem(52),
                  color: 'var(--mantine-color-dimmed)',
                }}
                stroke={1.5}
              />
              <Text size="xl" inline>
                Dra bilden hit eller klicka för att välja bild
              </Text>
            </>
          )}
        </Group>
      </Dropzone>
      <Button
        leftSection={<IconDeviceFloppy size={20} />}
        onClick={async () => {
          console.log('click');
        }}
      >
        Spara
      </Button>
    </Stack>
  );
}
