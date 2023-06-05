import Link from 'next/link'

export default function NotFound() {
  return (
    <>
      <h2>Inget recept här tyvärr!</h2>
      <p>
        Testa att gå tillbaka till <Link href="/">startsidan</Link>
      </p>
    </>
  )
}
