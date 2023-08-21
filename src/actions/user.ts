'use server';

import { revalidatePath } from 'next/cache';
import { cookies } from 'next/headers';
import { SignUpSchema, PasswordChangeSchema, UserSchema } from '@/types/user';
import { config } from '@/utils/config';
import { extractError } from '@/utils/extractError';

export const signUp = async (user: SignUpSchema): Promise<string> => {
  const res = await fetch(
    `${config.apiEndpoint}/rpc/${
      !user.provider || user.provider === 'credentials' ? 'signup' : 'signup_provider'
    }`,
    {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(user),
    }
  );

  if (!res.ok) {
    const msg = await res.json();
    switch (msg.error) {
      case 'already-exists':
        return `E-post adressen ${user.email} är redan registrerad`;
      default:
        return 'Något gick fel, försök igen senare';
    }
  }

  revalidatePath('/');

  return '';
};

export const resetPassword = async (user: PasswordChangeSchema): Promise<{ error: string }> => {
  const token = cookies().get('next-auth.session-token')?.value;

  try {
    if (!token) {
      throw new Error('Unauthorized');
    }

    const res = await fetch(`${config.apiEndpoint}/rpc/reset_password`, {
      method: 'POST',
      headers: {
        Authorization: `Bearer ${token}`,
        'Content-Type': 'application/json',
        Prefer: 'return=representation',
      },
      body: JSON.stringify({
        email: user.email,
        old_password: user.oldPassword,
        new_password: user.password,
      }),
    });

    if (!res.ok) {
      const msg = await res.json();
      return {
        error: msg.message,
      };
    }

    return { error: '' };
  } catch (error: unknown) {
    const message = extractError(error);
    return {
      error: message,
    };
  }
};

export const deleteUser = async (user: UserSchema) => {
  const token = cookies().get('next-auth.session-token')?.value;

  try {
    if (!token) {
      throw new Error('Unauthorized');
    }

    const res = await fetch(`${config.apiEndpoint}/users?email=eq.${user.email}`, {
      method: 'DELETE',
      headers: {
        Authorization: `Bearer ${token}`,
        'Content-Type': 'application/json',
        Prefer: 'return=representation',
      },
    });

    const json = await res.json();
    if (!json.length || !json[0] || !json[0].id) {
      throw new Error('Something went wrong');
    }
  } catch (error) {
    const message = extractError(error);
    console.error(message);
  }
};

export const getUser = async (email: string): Promise<UserSchema | null> => {
  const token = cookies().get('next-auth.session-token')?.value;

  try {
    if (!token) {
      throw new Error('Unauthorized');
    }

    const res = await fetch(`${config.apiEndpoint}/users?email=eq.${email}`, {
      method: 'GET',
      headers: {
        Authorization: `Bearer ${token}`,
        'Content-Type': 'application/json',
      },
    });

    const user = await res.json();

    if (!res.ok) {
      throw new Error(user.message);
    }

    return user[0];
  } catch (error) {
    const message = extractError(error);
    console.error(message);
    return null;
  }
};

export const updateUser = async (user: UserSchema, name: string) => {
  const token = cookies().get('next-auth.session-token')?.value;

  try {
    if (!token) {
      throw new Error('Unauthorized');
    }

    const res = await fetch(`${config.apiEndpoint}/users?id=eq.${user.id}`, {
      method: 'PUT',
      headers: {
        Authorization: `Bearer ${token}`,
        'Content-Type': 'application/json',
        Prefer: 'return=representation',
      },
      body: JSON.stringify({
        id: user.id,
        email: user.email,
        name,
      }),
    });

    if (!res.ok) {
      const msg = await res.json();
      throw new Error(msg.message);
    }

    return '';
  } catch (error) {
    const message = extractError(error);
    return message;
  }
};
