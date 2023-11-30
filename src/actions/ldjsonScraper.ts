'use server';

import puppeteer, { Browser, Page } from 'puppeteer';

import { RecipeSchema, IngredientSchema, InstructionSchema } from '@/types/recipe';
import { config } from '@/utils/config';
import { decodeHtmlEntities } from '@/utils/decoder';
import { parseIngredient } from '@/utils/ingredientParser';
import { convertDurationtoMinutes } from '@/utils/time';
import { replaceWrittenNumbersWithNumerals } from '@/utils/strings';

const DEFAULT_CATEGORIES = [config.categoryIfNonExist];

export type Recipe = {
  '@context': string;
  '@type': string;
  name: string;
  image: string | string[] | { url: string } | Array<{ '@id': string }>;
  url: string;
  description: string;
  datePublished: string;
  dateModified: string;
  author: Author;
  aggregateRating: AggregateRating;
  prepTime: string;
  cookTime: string;
  totalTime: string;
  cookingMethod: string;
  recipeCategory: string;
  recipeCuisine: string;
  recipeYield: string;
  nutrition: Nutrition;
  recipeIngredient?: string[] | null;
  recipeInstructions?: RecipeInstructionsEntity[] | null;
  interactionStatistic: InteractionStatistic;
  commentCount: number;
};

export type Author =
  | {
      '@type': string;
      name: string;
    }
  | Array<{
      '@type': string;
      name: string;
    }>;

export type AggregateRating = {
  '@type': string;
  ratingValue: number;
  reviewCount: number;
};

export type Nutrition = {
  '@type': string;
  servingSize: string;
  calories: string;
  fatContent: string;
  carbohydrateContent: string;
  proteinContent: string;
};

export type RecipeInstructionsEntity =
  | {
      '@type': string;
      text: string;
    }
  | string
  | {
      '@type': 'HowToSection';
      name: string;
      itemListElement: HowToStepEntity[];
    };

export type HowToStepEntity = {
  '@type': 'HowToStep';
  text: string;
  url: string;
};

export type InteractionStatistic = {
  '@type': string;
  interactionType: string;
  userInteractionCount: number;
};

const isObject = (obj: unknown): obj is Record<string, unknown> =>
  typeof obj === 'object' && obj !== null;

const isHowToSection = (
  instruction: unknown
): instruction is { '@type': 'HowToSection'; name: string; itemListElement: HowToStepEntity[] } =>
  isObject(instruction) &&
  instruction['@type'] === 'HowToSection' &&
  Array.isArray(instruction.itemListElement);

const isHowToStep = (instruction: unknown): instruction is { '@type': 'HowToStep'; text: string } =>
  isObject(instruction) &&
  instruction['@type'] === 'HowToStep' &&
  typeof instruction.text === 'string';

const extractImageUrl = (image: Recipe['image']): string => {
  if (typeof image === 'string') return image;
  if (Array.isArray(image) && typeof image[0] === 'string') return image[0];
  if (Array.isArray(image) && isObject(image[0]) && '@id' in image[0]) return image[0]['@id'];
  if (isObject(image) && 'url' in image) return image.url;
  return '';
};

const convertRecipeToRecipeSchema = (originalRecipe: Recipe): RecipeSchema => {
  const ingredients: IngredientSchema[] =
    originalRecipe.recipeIngredient?.map(parseIngredient) ?? [];

  const instructions: InstructionSchema[] = [];

  if (originalRecipe.recipeInstructions) {
    originalRecipe.recipeInstructions.forEach((instruction) => {
      if (typeof instruction === 'string') {
        instructions.push({ step: decodeHtmlEntities(instruction) });
      } else if (isHowToStep(instruction)) {
        instructions.push({ step: decodeHtmlEntities(instruction.text) });
      } else if (isHowToSection(instruction)) {
        // Loop through the itemListElement array for each HowToSection
        instruction.itemListElement.forEach((step) => {
          if (isHowToStep(step)) {
            instructions.push({ step: decodeHtmlEntities(step.text) });
          }
        });
      } else {
        // TODO: Handle other cases as needed, or log an unsupported format warning
      }
    });
  }

  const categories = Array.isArray(originalRecipe.recipeCategory)
    ? originalRecipe.recipeCategory
    : originalRecipe?.recipeCategory?.split(',') || DEFAULT_CATEGORIES;

  const { prep_time, cook_time } = convertDurationtoMinutes(
    originalRecipe.prepTime,
    originalRecipe.cookTime,
    originalRecipe.totalTime
  );

  return {
    name: decodeHtmlEntities(originalRecipe.name),
    author: originalRecipe.author
      ? Array.isArray(originalRecipe.author)
        ? originalRecipe.author[0].name
        : originalRecipe.author.name ?? ''
      : '',
    categories,
    date_published: originalRecipe.datePublished,
    date_modified: originalRecipe.dateModified,
    recipe_yield: originalRecipe.recipeYield
      ? parseInt(replaceWrittenNumbersWithNumerals(originalRecipe.recipeYield), 10)
      : config.defaultRecipeYield,
    recipe_yield_name: config.defaultRecipeYieldName,
    prep_time,
    cook_time,
    ingredients,
    instructions,
    description: decodeHtmlEntities(originalRecipe.description),
    image: extractImageUrl(originalRecipe.image),
  };
};

export const scrapeJsonLd = async (url: string): Promise<RecipeSchema | null> => {
  let browser: Browser | undefined;
  let page: Page | undefined;

  try {
    browser = await puppeteer.launch();
    page = await browser.newPage();
    await page.goto(url, { waitUntil: 'domcontentloaded' });

    const jsonLdContentString = await page.evaluate(() => {
      const scriptTag = document.querySelector('script[type="application/ld+json"]');
      return scriptTag ? scriptTag.innerHTML : null;
    });

    if (jsonLdContentString) {
      let jsonLdContent = JSON.parse(jsonLdContentString);

      if (jsonLdContent['@graph']) {
        jsonLdContent = jsonLdContent['@graph'].find(
          (item: any) => item['@type'] === 'Recipe' || item['@type'][0] === 'Recipe'
        );
      } else if (Array.isArray(jsonLdContent)) {
        jsonLdContent = jsonLdContent.find(
          (item) => item['@type'] === 'Recipe' || item['@type'][0] === 'Recipe'
        );
      }

      if (
        jsonLdContent &&
        (jsonLdContent['@type'] === 'Recipe' || jsonLdContent['@type'][0] === 'Recipe')
      ) {
        return convertRecipeToRecipeSchema(jsonLdContent as Recipe);
      }
    }

    return null;
  } catch (error) {
    console.error('An error occurred:', error);
    return null;
  } finally {
    if (page) {
      await page.close();
    }
    if (browser) {
      await browser.close();
    }
  }
};
