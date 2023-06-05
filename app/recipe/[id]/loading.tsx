import styles from './page.module.css'

export default async function Loading() {
  return (
    <main>
      <div className={styles.recipe}>
        <div className={styles.data}>
          <h1 className={styles.heading}></h1>
          <div className={styles.description}></div>
          <div className={styles.ingredients}></div>
        </div>
        <div className={styles.image}>
          <div className={styles['no-image']}></div>
        </div>
      </div>
    </main>
  )
}
