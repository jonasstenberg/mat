import { getServerSession } from 'next-auth';
// import configureMeasurements from 'convert-units';
// import allMeasures from 'convert-units/lib/esm/definitions';

import { getRecipes } from '@/lib/recipes';
import Recipes from '@/components/Recipes';
import { getCategories } from '@/lib/categories';
import { authOptions } from '@/utils/nextAuthOptions';

export type HomeProps = {
  searchParams?: {
    search?: string;
    sort?: string;
    category?: string;
  };
};

export default async function Home({ searchParams }: HomeProps) {
  const search = searchParams?.search ?? '';
  const filteredCategoryParam = searchParams?.category ?? '';

  const session = await getServerSession(authOptions);
  const recipes = await getRecipes({
    owner: session?.user.email,
    search,
    filteredCategoryParam,
  });
  const categories = await getCategories();

  return (
    <Recipes
      session={session}
      searchParams={searchParams}
      recipes={recipes}
      categories={categories}
    />
  );
}
