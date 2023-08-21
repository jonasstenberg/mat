import { ResolvingMetadata, Metadata } from 'next';
import Image from 'next/image';
import { notFound } from 'next/navigation';
import React from 'react';
import dynamic from 'next/dynamic';
import { getServerSession } from 'next-auth';

import { authOptions } from '@/app/api/auth/[...nextauth]/route';
import { getRecipe } from '@/lib/recipes';
import styles from './styles.module.css';
import Ingredients from './Ingredients';
import ServingsSlider from '@/components/ServingsSlider';
import { config } from '@/utils/config';

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

export default async function Page({ params, searchParams }: Props) {
  const recipe = await getRecipe(params.id);
  const session = await getServerSession(authOptions);

  const servings = Number(searchParams.servings || recipe.servings || config.defaultServings);
  const cookTime = recipe.prep_time || recipe.cook_time ? recipe.prep_time + recipe.cook_time : 0;

  return (
    <main className={styles.recipe}>
      {session?.user?.email === recipe.owner && <RecipeActions recipe={recipe} />}
      <div className={styles['recipe-heading']}>
        <h2>{recipe.name}</h2>
      </div>
      {recipe.image ? (
        <Image
          priority
          src={`/api/image?filename=${recipe.image}`}
          className={styles['recipe-image']}
          height={400}
          width={400}
          quality={100}
          alt={recipe.name}
        />
      ) : (
        <div className={styles['recipe-image-no-image']} />
      )}
      <aside className={styles['recipe-sidebar']}>
        <dl>
          <dt>Portioner</dt>
          <dd>
            <ServingsSlider servings={servings} />
          </dd>
          {cookTime > 0 && (
            <>
              <dt>Tid</dt>
              <dd>{cookTime} min</dd>
            </>
          )}
          <dt>Ingredienser</dt>
          <dd>{recipe.ingredients.length}</dd>
        </dl>
        <div className={styles['recipe-ingredients']}>
          <Ingredients recipe={recipe} servings={servings} />
        </div>
      </aside>
      <div className={styles['recipe-description']}>
        <h4>Gör så här</h4>
        {recipe.description.split('\n').map((str, index) => {
          if (str.startsWith('#')) {
            const hashes = str?.match(/#/g)?.length;
            const CustomTag = `h${hashes}` as keyof JSX.IntrinsicElements;
            return <CustomTag key={index}>{str.replace(/#/g, '')}</CustomTag>;
          }
          return `${str}\n`;
        })}
      </div>
    </main>
  );
}
