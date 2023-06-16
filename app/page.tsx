import Link from "next/link";

import styles from "./page.module.css";
import { getRecipes } from "@/lib/recipes";
import { Recipe } from "@/types/recipe";
import Search from "@/components/Search";
import Image from "next/image";

type Props = {
  searchParams?: {
    search?: string;
  };
};

export default async function Home({ searchParams }: Props) {
  const search = searchParams?.search ?? "";
  const recipes = await getRecipes(search);

  return (
    <>
      <div className={styles["search-wrapper"]}>
        <Search />
      </div>
      <main>
        <div className={styles.grid}>
          {recipes?.map((recipe) => (
            <Recipes key={recipe.id} recipe={recipe} />
          ))}
        </div>
      </main>
    </>
  );
}

function Recipes({ recipe }: { recipe: Recipe }) {
  const { id, name, ingredients, image } = recipe || {};
  return (
    <div className={styles.recipe} key={id}>
      {image ? (
        <div className={styles["image-container"]}>
          <Image
            className={styles["image"]}
            src={`https://mat.stenberg.io/images/${image}-840.jpg`}
            loading="lazy"
            alt={name}
            sizes="(max-width: 600px) 90vw, (max-width: 1200px) 300px"
            fill />
        </div>
      ) : (
        <div className={styles["no-image"]}></div>
      )}
      <div className={styles["recipe-info"]}>
        <h2 className={styles["recipe-title"]}>
          <Link href={`/recipe/${id}`}>{name}</Link>
        </h2>
        <div className={styles["recipe-metadata"]}>{ingredients.length} ingredients </div>
      </div>
    </div>
  );
}
