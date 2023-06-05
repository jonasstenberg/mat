import Search from '../components/Search'
import LoginButton from '../components/LoginButton'
import styles from './page.module.css'
import { Recipe } from '../types/recipe'

export default async function Loading() {
  return (
    <>
      <div className={styles['search-wrapper']}>
        <Search />
      </div>
      <main>
        <div className={styles.grid}>
          {[...Array(12)]
            .map((u, i) => ({ id: `${i}` }))
            ?.map((recipe) => (
              <RecipeData key={recipe.id} recipe={recipe} />
            ))}
        </div>
      </main>
    </>
  )
}

function RecipeData({ recipe }: { recipe: { id: string } }) {
  const { id } = recipe || {}
  return (
    <div className={styles.restaurant} key={id}>
      <div className={styles['restaurant-info']}>
        <h2 className={styles.title}></h2>
        <div className={styles.metadata}></div>
      </div>
      <div className={styles['no-image']}></div>
    </div>
  )
}
