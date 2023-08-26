import dynamic from 'next/dynamic';

import Image from 'next/image';
import Link from 'next/link';
import { Session } from 'next-auth';
import { RecipeSchema } from '@/types/recipe';
import styles from '@/app/page.module.css';
import AddButton from '@/components/AddButton';
import Filters from '@/components/Filters';
import Sort from '@/components/Sort';
import clock from '../../public/clock.svg';
import { HomeProps } from '@/app/page';

const Search = dynamic(() => import('@/components/Search'), {
  loading: () => <p />,
  ssr: false,
});

const formatTime = (minutes: number): string => {
  if (minutes < 60) {
    const thresholds = [15, 30, 45, 60];
    const threshold = thresholds.find((t) => minutes < t) || 60;
    return `Under ${threshold} min`;
  }

  const hours = Math.floor(minutes / 60);
  return `Över ${hours} ${hours === 1 ? 'timme' : 'timmar'}`;
};

function Recipe({ recipe }: { recipe: RecipeSchema }) {
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
          <Link prefetch={false} href={`/recipe/${id}`}>
            {name}
          </Link>
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

type RecipesProps = {
  session: Session | null;
  searchParams: HomeProps['searchParams'];
  recipes: RecipeSchema[];
  categories: string[];
};

export default function Recipes({ session, searchParams, recipes, categories }: RecipesProps) {
  const sortValue = searchParams?.sort ?? '';
  const search = searchParams?.search ?? '';
  const filteredCategoryParam = searchParams?.category ?? '';

  const sortRecipes = (r: RecipeSchema[], s: string) => {
    const sortedRecipes = [...r]; // Create a shallow copy to avoid modifying original array

    if (!s) {
      sortedRecipes.sort((a, b) => {
        const dateA = a.date_published ? new Date(a.date_published).getTime() : NaN;
        const dateB = b.date_published ? new Date(b.date_published).getTime() : NaN;
        if (Number.isNaN(dateA) && Number.isNaN(dateB)) return 0;
        if (Number.isNaN(dateA)) return 1;
        if (Number.isNaN(dateB)) return -1;
        return dateB - dateA;
      });
    } else if (s === 'alphabetic') {
      sortedRecipes.sort((a, b) => a.name.localeCompare(b.name));
    }

    return sortedRecipes;
  };

  return (
    <>
      <div className={styles['top-container']}>
        <div className={styles['search-container']}>
          <Search searchQuery={search} />
        </div>
        {session?.user.email ? <AddButton /> : ''}
      </div>
      <main className={styles.recipes}>
        <div className={styles.options}>
          <Filters categories={categories} filteredCategoryParam={filteredCategoryParam} />
          <Sort />
        </div>
        <div className={styles.grid}>
          {sortRecipes(recipes, sortValue)?.map((recipe) => (
            <Recipe key={recipe.id} recipe={recipe} />
          ))}
        </div>
      </main>
    </>
  );
}
