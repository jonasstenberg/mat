import styles from '@/app/page.module.css';

export default async function Loading() {
  return (
    <main>
      <div className={styles.recipe}>
        <div className={styles['recipe-data']}>
          <h1 className={styles['recipe-heading']}> </h1>
          <div className={styles['recipe-description']} />
          <div className={styles.ingredients} />
        </div>
        <div className={styles['recipe-image-no-image']} />
      </div>
    </main>
  );
}
