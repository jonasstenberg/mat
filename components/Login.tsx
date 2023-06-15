'use client'

import { signIn } from "next-auth/react";

import styles from "@/app/page.module.css";
import AvatarSvg from '@/public/avatar.svg'
import Image from 'next/image'

export default function Login() {
  const handleSignIn = () => {
    signIn()
  }

  return (
    <div className={styles.user}>
      <button className={styles['login-button']} onClick={handleSignIn}>
        <Image src={AvatarSvg} alt="Login" width="32" height="32" />
      </button>
    </div>
  )
}
