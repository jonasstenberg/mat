export interface RecipeProps {
  id?: string;
  name: string;
  categories: CategoryProps[];
  date_added?: string;
  date_updated?: string;
  servings: number;
  servings_name: string;
  prep_time: number;
  cook_time: number;
  ingredients: IngredientProps[];
  description: string;
  image: string | File | null;
  owner?: string;
}

export interface CategoryProps {
  id?: string;
  name: string;
  date_added?: string;
  date_updated?: string;
  owner?: string;
}

export interface IngredientProps {
  id: string | number;
  quantity: string;
  measurement: string;
  name: string;
  owner?: string;
}
