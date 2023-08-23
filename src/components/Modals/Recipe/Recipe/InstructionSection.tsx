'use client';

import { DraggableProvided } from '@hello-pangea/dnd';
import { Center, CloseButton, Group, Textarea } from '@mantine/core';
import { UseFormReturnType } from '@mantine/form';
import { IconGripVertical } from '@tabler/icons-react';
import { InstructionSchema, RecipeSchema } from '@/types/recipe';
import DraggableFieldset from '@/components/DraggableFieldset';

type InstructionSectionProps = {
  instructions: InstructionSchema[];
  form: UseFormReturnType<RecipeSchema>;
};

export const InstructionSection: React.FC<InstructionSectionProps> = ({ instructions, form }) => {
  const renderInstruction = (
    instruction: InstructionSchema,
    index: number,
    provided: DraggableProvided
  ) => (
    <Group
      grow
      preventGrowOverflow={false}
      wrap="nowrap"
      key={instruction.id}
      ref={provided.innerRef}
      mb="md"
      {...provided.draggableProps}
    >
      <Center {...provided.dragHandleProps}>
        <IconGripVertical size={18} />
      </Center>
      <Textarea
        placeholder={`Steg ${index + 1}`}
        w="85%"
        styles={{
          input: {
            resize: 'vertical',
            height: '6rem',
          },
        }}
        withAsterisk
        {...form.getInputProps(`instructions.${index}.step`)}
      />
      <CloseButton onClick={() => form.removeListItem('instructions', index)} />
    </Group>
  );

  return (
    <DraggableFieldset<InstructionSchema>
      items={instructions}
      renderItem={renderInstruction}
      onReorder={(from, to) => form.reorderListItem('instructions', { from, to })}
      onAddItem={() => form.insertListItem('instructions', { id: Date.now(), step: '' })}
      legend="Steg"
      error={form.errors.instructions}
    />
  );
};
