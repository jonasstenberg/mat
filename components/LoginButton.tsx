'use client'

import { signIn, signOut, useSession } from 'next-auth/react'
import React from 'react'

export default function LoginButton() {
  const { data: session } = useSession()
  return (
    <div>
      {session?.user ? (
        <>
          <div>{session.user.name}</div>
          <button onClick={() => signOut()}>Sign out</button>
        </>
      ) : (
        <button onClick={() => signIn()}>Sign in</button>
      )}
    </div>
  )
}
