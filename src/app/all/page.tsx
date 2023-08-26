import { getServerSession } from 'next-auth';
import { getRecipes } from '@/lib/recipes';
import { authOptions } from '@/app/api/auth/[...nextauth]/route';
import Recipes from '@/components/Recipes';
import { getCategories } from '@/lib/categories';

export type AllProsp = {
  searchParams?: {
    search?: string;
    sort?: string;
    category?: string;
  };
};

export default async function All({ searchParams }: AllProsp) {
  const search = searchParams?.search ?? '';
  const filteredCategoryParam = searchParams?.category ?? '';

  const session = await getServerSession(authOptions);
  const recipes = await getRecipes({
    owner: undefined,
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
