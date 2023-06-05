'use client'

import { useEffect, useState, useTransition } from 'react'
import { usePathname, useRouter } from 'next/navigation'

import styles from '../app/page.module.css'
import useDebounce from '../utils/debounce'

export default function Search() {
  const [search, setSearch] = useState('')
  const { replace } = useRouter()
  const pathname = usePathname()
  const [, startTransition] = useTransition()

  const debouncedValue = useDebounce(search, 500)

  useEffect(() => {
    const params = new URLSearchParams(window.location.search)

    if (debouncedValue) {
      params.set('search', debouncedValue)
    } else {
      params.delete('search')
    }

    startTransition(() => {
      replace(`${pathname}?${params.toString()}`)
    })
  }, [debouncedValue, pathname, replace])

  return (
    <div className={styles.search}>
      <input
        type="text"
        placeholder="Sök ingrediens eller recept"
        className={styles['search-input']}
        onChange={(e) => setSearch(e.target.value)}
      />
    </div>
  )
}
