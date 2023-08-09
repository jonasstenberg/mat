export interface RecipeProps {
  id?: string;
  name: string;
  categories: CategoryProps[];
  date_added?: string;
  date_updated?: string;
  servings: number;
  prep_time: number;
  cook_time: number;
  ingredients: IngredientProps[];
  description: string;
  image: string | File | null;
}

export interface CategoryProps {
  id?: string;
  name: string;
  date_added?: string;
  date_updated?: string;
}

export interface IngredientProps {
  id: string | number;
  quantity: string;
  measurement: string;
  name: string;
}
