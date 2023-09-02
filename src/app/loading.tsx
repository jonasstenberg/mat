import Search from '../components/Search';
import styles from './page.module.css';

type RecipeDataProps = {
  recipe: {
    id: string;
  };
};

function RecipeData({ recipe }: RecipeDataProps) {
  const { id } = recipe || {};
  return (
    <div className={styles.restaurant} key={id}>
      <div className={styles['restaurant-info']}>
        <h2 className={styles.title}> </h2>
        <div className={styles.metadata} />
      </div>
      <div className={styles['no-image']} />
    </div>
  );
}

export default async function Loading() {
  return (
    <>
      <div className={styles['top-container']}>
        <Search searchQuery="" />
      </div>
      <main className={styles.recipes}>
        <div className={styles.grid}>
          {[...Array(12)]
            .map((_, i) => ({ id: `${i}` }))
            ?.map((recipe) => (
              <RecipeData key={recipe.id} recipe={recipe} />
            ))}
        </div>
      </main>
    </>
  );
}
