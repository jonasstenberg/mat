'use client';

import React from 'react';
import { FileButton, Button, Image, Group, Fieldset, Stack } from '@mantine/core';

interface ImageUploaderProps {
  image: File | null | string;
  setImage: React.Dispatch<React.SetStateAction<File | null | string>>;
  clearImage: () => void;
}

const ImageUploader: React.FC<ImageUploaderProps> = ({ image, setImage, clearImage }) => (
  <Fieldset legend="Bilduppladdning">
    <Stack>
      <Group grow>
        <FileButton onChange={setImage} accept="image/*">
          {(props) => <Button {...props}>Ladda upp bild</Button>}
        </FileButton>
        <Button disabled={!image} color="red" onClick={clearImage}>
          Ta bort
        </Button>
      </Group>
      {image && (
        <Image
          h={200}
          w="auto"
          fit="cover"
          src={
            typeof image === 'string' ? `/api/image?filename=${image}` : URL.createObjectURL(image)
          }
          alt="Förhandsgranskning"
        />
      )}
    </Stack>
  </Fieldset>
);

export default ImageUploader;
