import Link from 'next/link'
import { getServerSession } from 'next-auth'

import styles from './page.module.css'
import { getRecipes } from '@/lib/recipes'
import { Recipe } from '@/types/recipe'
import LoginButton from '@/components/LoginButton'
import { authOptions } from '@/app/api/auth/[...nextauth]/route'
import Search from '@/components/Search'

type Props = {
  searchParams?: {
    search?: string
  }
}

export default async function Home({ searchParams }: Props) {
  const session = await getServerSession(authOptions)
  const search = searchParams?.search ?? ''
  const recipes = await getRecipes(search)

  return (
    <>
      <div className={styles['search-wrapper']}>
        <Search />
      </div>
      <main>
        <div className={styles.grid}>
          {recipes?.map((recipe) => (
            <Recipes key={recipe.id} recipe={recipe} />
          ))}
        </div>
      </main>
    </>
  )
}

function Recipes({ recipe }: { recipe: Recipe }) {
  const { id, name, ingredients, image } = recipe || {}
  return (
    <div className={styles.restaurant} key={id}>
      <div className={styles['restaurant-info']}>
        <h2 className={styles['recipe-title']}>
          <Link href={`/recipe/${id}`}>{name}</Link>
        </h2>
        <div className={styles.metadata}>{ingredients.length} ingredients </div>
      </div>
      {image ? (
        <div
          className={styles['image-container']}
          style={{ backgroundImage: `url(https://mat.stenberg.io/images/${image}-840.jpg)` }}
        ></div>
      ) : (
        <div className={styles['no-image']}></div>
      )}
    </div>
  )
}
