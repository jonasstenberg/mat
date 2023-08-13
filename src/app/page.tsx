import Link from 'next/link';
import Image from 'next/image';
import dynamic from 'next/dynamic';

import styles from './page.module.css';
import { getRecipes } from '@/lib/recipes';
import { RecipeProps } from '@/types/recipe';
import clock from '../../public/clock.svg';

const Search = dynamic(() => import('@/components/Search'), {
  loading: () => <p />,
  ssr: false,
});

type Props = {
  searchParams?: {
    search?: string;
  };
};

const formatTime = (minutes: number): string => {
  if (minutes < 60) {
    const thresholds = [15, 30, 45, 60];
    const threshold = thresholds.find((t) => minutes < t) || 60;
    return `Under ${threshold} min`;
  }

  const hours = Math.floor(minutes / 60);
  return `Över ${hours} ${hours === 1 ? 'timme' : 'timmar'}`;
};

function Recipe({ recipe }: { recipe: RecipeProps }) {
  const { id, name, image } = recipe || {};
  return (
    <div className={styles.recipe} key={id}>
      {image ? (
        <div className={styles['image-container']}>
          <Image
            className={styles.image}
            src={`/api/image?filename=${recipe.image}`}
            loading="lazy"
            alt={name}
            sizes="(max-width: 600px) 90vw, (max-width: 1200px) 300px"
            fill
          />
        </div>
      ) : (
        <div className={styles['no-image']} />
      )}
      <div className={styles['recipe-info']}>
        <h2 className={styles['recipe-title']}>
          <Link href={`/recipe/${id}`}>{name}</Link>
        </h2>
        <div className={styles['recipe-metadata']}>
          {recipe.prep_time || recipe.cook_time ? (
            <>
              <Image src={clock} alt="clock" className={styles.clock} />
              {formatTime(recipe.prep_time + recipe.cook_time)}
            </>
          ) : (
            <p>&nbsp;</p>
          )}
        </div>
      </div>
    </div>
  );
}

export default async function Home({ searchParams }: Props) {
  const search = searchParams?.search ?? '';
  const recipes = await getRecipes(search);

  return (
    <>
      <div className={styles['search-wrapper']}>
        <Search searchQuery={search} />
      </div>
      <main className={styles.recipes}>
        <div className={styles.grid}>
          {recipes?.map((recipe) => (
            <Recipe key={recipe.id} recipe={recipe} />
          ))}
        </div>
      </main>
    </>
  );
}
