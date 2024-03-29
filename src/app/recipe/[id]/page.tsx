import { ResolvingMetadata, Metadata } from 'next';
import Image from 'next/image';
import { notFound } from 'next/navigation';
import React from 'react';
import dyn from 'next/dynamic';
import { getServerSession } from 'next-auth';
import { serialize } from 'tinyduration';

import { getRecipe } from '@/lib/recipes';
import styles from './styles.module.css';
import Ingredients from './Ingredients';
import RecipeYieldSlider from '@/components/RecipeYieldSlider';
import { config } from '@/utils/config';
import { capitalizeFirstLetter } from '@/utils/strings';
import { RecipeSchema } from '@/types/recipe';
import Instructions from './Instructions';
import { authOptions } from '@/utils/nextAuthOptions';

export const dynamic = 'force-dynamic';
export const fetchCache = 'force-no-store';
export const dynamicParams = true;
export const revalidate = 0;

const RecipeActions = dyn(() => import('@/components/RecipeActions'), {
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

const generateRecipeJSONLD = (recipe: RecipeSchema) => {
  const prepDuration = serialize({ minutes: recipe.prep_time });
  const cookDuration = serialize({ minutes: recipe.cook_time });
  const totalDuration = serialize({ minutes: recipe.prep_time + recipe.cook_time });

  return {
    '@context': 'https://schema.org/',
    '@type': 'Recipe',
    name: recipe.name,
    image:
      typeof recipe.image === 'string'
        ? `${config.baseUrl}/api/image?filename=${recipe.image}`
        : undefined,
    url: config.baseUrl,
    inLanguage: 'sv',
    recipeCategory: recipe.categories.join(', '),
    datePublished:
      recipe.date_published && new Date(recipe.date_published).toISOString().split('T')[0],
    dateModified:
      recipe.date_modified && new Date(recipe.date_modified).toISOString().split('T')[0],
    recipeYield: `${recipe.recipe_yield} ${recipe.recipe_yield_name}`,
    prepTime: recipe.prep_time > 0 ? prepDuration : undefined,
    cookTime: recipe.cook_time > 0 ? cookDuration : undefined,
    totalTime: recipe.prep_time + recipe.cook_time > 0 ? totalDuration : undefined,
    recipeIngredient: recipe.ingredients.map(
      (ingredient) => `${ingredient.quantity} ${ingredient.measurement} ${ingredient.name}`
    ),
    recipeInstructions: recipe.instructions
      ? recipe.instructions?.map((instruction) => ({
          '@type': 'HowToStep',
          text: instruction.step,
        }))
      : undefined,
    description: recipe.description || undefined,
    author: {
      '@type': 'Person',
      name: recipe.author || undefined,
    },
  };
};

export default async function Page({ params, searchParams }: Props) {
  const recipe = await getRecipe(params.id);
  const session = await getServerSession(authOptions);

  if (!recipe) {
    return <p>...</p>;
  }

  const recipeYield = Number(
    searchParams.yield || recipe.recipe_yield || config.defaultRecipeYield
  );
  const cookTime = recipe.prep_time || recipe.cook_time ? recipe.prep_time + recipe.cook_time : 0;

  type RecipeImageProps = Pick<RecipeSchema, 'url' | 'image' | 'name'>;

  const RecipeImage = ({ url, image, name }: RecipeImageProps) => {
    const imageProps = {
      priority: true,
      src: `/api/image?filename=${image}`,
      className: styles['recipe-image'],
      height: 400,
      width: 400,
      quality: 100,
      alt: name,
    };

    return url ? (
      <a href={url}>
        <Image {...imageProps} />
      </a>
    ) : (
      <Image {...imageProps} />
    );
  };

  return (
    <main className={styles.recipe}>
      <script
        key="schema-jsonld"
        type="application/ld+json"
        dangerouslySetInnerHTML={{
          __html: JSON.stringify(generateRecipeJSONLD(recipe), null, '\t'),
        }}
      />
      <div className={styles['recipe-heading']}>
        <h2>{recipe.url ? <a href={recipe.url}>{recipe.name}</a> : recipe.name}</h2>
        {recipe.author ? (
          <p>
            Av:{' '}
            {recipe.url ? (
              <a href={recipe.url}>
                <span>{recipe.author}</span>
              </a>
            ) : (
              <span>{recipe.author}</span>
            )}
          </p>
        ) : (
          ''
        )}
      </div>
      {recipe.image ? (
        <RecipeImage url={recipe.url} image={recipe.image} name={recipe.name} />
      ) : (
        <div className={styles['recipe-image-no-image']} />
      )}
      {session?.user?.email === recipe.owner && <RecipeActions recipe={recipe} />}
      {recipe.description ? (
        <section className={styles['recipe-description']}>
          <>
            <h4>Beskrivning</h4>
            <p>{recipe.description}</p>
          </>
        </section>
      ) : (
        ''
      )}
      <aside className={styles['recipe-meta']}>
        <dl>
          <dt>{capitalizeFirstLetter(recipe.recipe_yield_name)}</dt>
          <dd>
            <RecipeYieldSlider recipeYield={recipeYield} />
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
      </aside>
      <aside className={styles['recipe-ingredients']}>
        <Ingredients recipe={recipe} recipeYield={recipeYield} />
      </aside>
      <Instructions instructions={recipe.instructions} />
    </main>
  );
}
