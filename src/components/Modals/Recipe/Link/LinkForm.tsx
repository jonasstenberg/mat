import { Button, Stack, TextInput } from '@mantine/core';
import { IconDeviceFloppy } from '@tabler/icons-react';

export default function LinkForm() {
  return (
    <Stack gap="sm">
      <TextInput label="Länk" placeholder="https://www.example.com" type="url" />
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
