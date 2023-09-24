'use client';

import React, { ReactNode } from 'react';
import { Fieldset, Stack, Button, Text } from '@mantine/core';
import { DragDropContext, Droppable, Draggable } from '@hello-pangea/dnd';
import type { DraggableProvided, DropResult, DroppableProvided } from '@hello-pangea/dnd';
import { useDraggableInPortal } from '@/hooks/useDraggableInPortal';

type DraggableItem = {
  id?: number | string;
};

type DraggableFieldsetProps<T extends DraggableItem> = {
  items: T[];
  renderItem: (item: T, index: number, provided: DraggableProvided) => JSX.Element;
  onReorder: (from: number, to: number) => void;
  onAddItem: () => void;
  legend: string;
  error: ReactNode;
};

const DraggableFieldset = <T extends DraggableItem>({
  items,
  renderItem,
  onReorder,
  onAddItem,
  legend,
  error,
}: DraggableFieldsetProps<T>) => {
  const renderDraggable = useDraggableInPortal();

  return (
    <Fieldset legend={legend}>
      <Stack gap="sm">
        <DragDropContext
          onDragEnd={({ destination, source }: DropResult) =>
            onReorder(source.index, destination!.index)
          }
        >
          <Droppable droppableId="dnd-list" direction="vertical">
            {(provided: DroppableProvided) => (
              <div {...provided.droppableProps} ref={provided.innerRef}>
                {items.map((item, index) => (
                  <Draggable key={index} index={index} draggableId={index.toString()}>
                    {renderDraggable((innerProvided) => renderItem(item, index, innerProvided))}
                  </Draggable>
                ))}
                {provided.placeholder}
              </div>
            )}
          </Droppable>
        </DragDropContext>
        {error ? (
          <Text c="red" size="xs" style={{ whiteSpace: 'pre-line' }}>
            {error}
          </Text>
        ) : (
          ''
        )}
        <Button onClick={onAddItem}>Lägg till</Button>
      </Stack>
    </Fieldset>
  );
};

export default DraggableFieldset;
