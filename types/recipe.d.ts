export interface Recipe {
  id: string
  name: string
  date_added: string
  date_updated: string
  ingredients: string[] | Ingredient[]
  description: string
  image: string
  thumbnail: string
  categories: Category[]
}
