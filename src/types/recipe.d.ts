export interface RecipeProps {
  id?: string;
  name: string;
  date_added?: string;
  date_updated?: string;
  servings: number;
  prep_time: number;
  cook_time: number;
  ingredients: IngredientProps[];
  description: string;
  image?: string | File | undefined | null;
  thumbnail?: string;
  categories?: Category[];
}

export interface CategoryProps {
  id?: string;
  name: string;
  date_added?: string;
  date_updated?: string;
}

export interface IngredientProps {
  quantity: string;
  measurement: string;
  name: string;
}
