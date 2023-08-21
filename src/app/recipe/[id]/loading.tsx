import styles from '@/app/page.module.css';

export default async function Loading() {
  return (
    <main className={styles.recipe}>
      <div className={styles['recipe-heading']}>
        <h2> </h2>
      </div>
      <div className={styles['recipe-image-no-image']} />
      <aside className={styles['recipe-sidebar']}> </aside>
      <div className={styles['recipe-description']} />
    </main>
  );
}
