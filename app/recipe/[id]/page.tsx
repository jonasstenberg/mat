import { ResolvingMetadata, Metadata } from 'next';
import Image from 'next/image';
import { notFound } from 'next/navigation';
import React from 'react';
import dynamic from 'next/dynamic';
import { getServerSession } from 'next-auth';
import { Divider, Text, Title } from '@mantine/core';

import { authOptions } from '@/app/api/auth/[...nextauth]/route';
import { getAllRecipeIds, getRecipe } from '@/lib/recipes';
import { RecipeProps } from '@/types/recipe';
import styles from '@/app/page.module.css';
import Ingredients from './Ingredients';

const RecipeActions = dynamic(() => import('@/components/RecipeActions'), {
  loading: () => <p />,
});

type Props = {
  params: { id: string };
  searchParams: { [key: string]: string | string[] | undefined };
};

export async function generateMetadata(
  { params }: Props,
  parent: ResolvingMetadata
): Promise<Metadata> {
  const recipe = await getRecipe(params.id);

  if (!recipe) {
    notFound();
  }

  const previousKeywords = (await parent).keywords || [];

  return {
    generator: 'Next.js',
    title: recipe.name,
    keywords: [...previousKeywords, recipe.name],
    openGraph: {
      title: recipe.name,
      description: `Recept till ${recipe.name}`,
      images:
        (recipe.image && [
          {
            url: `https://mat.stenberg.io/images/${recipe.image}-840.jpg`,
            width: 840,
            height: 630,
          },
        ]) ||
        undefined,
    },
  };
}

export async function generateStaticParams() {
  const recipes = await getAllRecipeIds();

  const ids = recipes.map((recipe: RecipeProps) => ({
    id: recipe.id,
  }));

  return ids;
}

export default async function Page({ params }: Props) {
  const recipe = await getRecipe(params.id);
  const session = await getServerSession(authOptions);

  return (
    <main>
      <div className={styles['recipe-individual']}>
        <div className={styles['recipe-data']}>
          {session?.user?.name && <RecipeActions recipe={recipe} />}
          <Title order={2} mt="md" mb="xs" className={styles['recipe-heading']}>
            {recipe.name}
          </Title>
          <Divider mt="md" mb="xs" />
          <Text size="sm">
            {recipe.servings} portioner
            {recipe.prep_time ? ` | ${recipe.prep_time} min preptid` : ''}
            {recipe.cook_time ? ` | ${recipe.cook_time} min tillagningstid` : ''}
          </Text>
          <Divider mt="xs" mb="lg" />
          <div className={styles['recipe-description']}>
            {recipe.description.split('\n').map((str) => {
              if (str.startsWith('#')) {
                const hashes = str?.match(/#/g)?.length;
                const CustomTag = `h${hashes}` as keyof JSX.IntrinsicElements;
                return <CustomTag key={str}>{str.replace(/#/g, '')}</CustomTag>;
              }
              return `${str}\n`;
            })}
          </div>
          <div className={styles.ingredients}>
            <Ingredients recipe={recipe} />
          </div>
        </div>
        {recipe.image ? (
          <Image
            priority
            src={`/api/image?filename=${recipe.image}`}
            className={styles['recipe-image']}
            height={600}
            width={600}
            quality={100}
            alt={recipe.name}
          />
        ) : (
          <div className={styles['recipe-image-no-image']} />
        )}
      </div>
    </main>
  );
}
