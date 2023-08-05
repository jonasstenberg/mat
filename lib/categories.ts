import { CategoryProps } from '@/types/recipe';
import { config } from '@/utils/config';

export async function getCategories(): Promise<CategoryProps[]> {
  const baseUrl = `${config.apiEndpoint}/categories`;

  const result = await fetch(baseUrl, {
    next: { revalidate: 3600 },
  });
  const categories = await result.json();

  return categories;
}
