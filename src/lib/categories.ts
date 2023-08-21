import { config } from '@/utils/config';

export async function getCategories(): Promise<string[]> {
  const baseUrl = `${config.apiEndpoint}/categories`;

  const result = await fetch(baseUrl);
  const categories = await result.json();

  return categories.map((category: { name: string }) => category.name);
}
