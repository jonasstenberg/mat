import { ResolvingMetadata, Metadata } from 'next'
import Image from 'next/image'
import { notFound } from 'next/navigation'

import { lora } from '@/fonts'
import { getAllRecipeIds, getRecipe } from '@/lib/recipes'
import { Recipe } from '@/types/recipe'
import styles from './page.module.css'
import React from 'react'
import clsx from 'clsx'
import Ingredients from './Ingredients'

type Props = {
  params: { id: string }
  searchParams: { [key: string]: string | string[] | undefined }
}

export async function generateMetadata({ params, searchParams }: Props, parent: ResolvingMetadata): Promise<Metadata> {
  const id = params.id
  const recipe = await getRecipe(params.id)

  if (!recipe) {
    notFound()
  }

  const previousKeywords = (await parent).keywords || []

  return {
    generator: 'Next.js',
    title: recipe.name,
    keywords: [...previousKeywords, recipe.name],
    openGraph: {
      title: recipe.name,
      description: `Recept till ${recipe.name}`,
      images: recipe.image && [
        {
          url: `https://mat.old.stenberg.io/images/${recipe.image}-840.jpg`,
          width: 840,
          height: 630
        }
      ]
    }
  }
}

export async function generateStaticParams() {
  const recipes = await getAllRecipeIds()

  const ids = recipes.map((recipe: Recipe) => ({
    id: recipe.id
  }))

  return ids
}

export default async function Page({ params, searchParams }: Props) {
  const recipe = await getRecipe(params.id)

  return (
    <main>
      <div className={styles.recipe}>
        <div className={styles.data}>
          <h2 className={clsx(lora.className, styles.heading)}>{recipe.name}</h2>
          <div className={styles.description}>
            {recipe.description.split('\n').map((str) => {
              if (str.startsWith('#')) {
                const hashes = str?.match(/#/g)?.length
                const CustomTag = `h${hashes}` as keyof JSX.IntrinsicElements
                return <CustomTag key={str}>{str.replace(/#/g, '')}</CustomTag>
              } else {
                return `${str}\n`
              }
            })}
          </div>
          <div className={styles.ingredients}>
            <Ingredients recipe={recipe} />
          </div>
        </div>
        {recipe.image ? (
          <Image
            priority
            src={`https://mat.old.stenberg.io/images/${recipe.image}-840.jpg`}
            className={styles.image}
            height={600}
            width={600}
            quality={100}
            alt={recipe.name}
          />
        ) : (
          <div className={styles['no-image']}></div>
        )}
      </div>
    </main>
  )
}
