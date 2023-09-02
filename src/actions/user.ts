'use server';

import { revalidatePath } from 'next/cache';
import { cookies } from 'next/headers';
import { getServerSession } from 'next-auth';
import { SignUpSchema, PasswordChangeSchema, UserSchema, UserNameSchema } from '@/types/user';
import { config } from '@/utils/config';
import { handleServerErrors } from '@/utils/handleServerErrors';
import { UNKNOWN_ERROR } from '@/utils/errors';
import { authOptions } from '@/app/api/auth/[...nextauth]/route';

const isProduction = config.baseUrl.startsWith('https');

export type UserResponse = {
  success?: { user?: UserSchema };
  errors?: { [key: string]: string };
};

const ERROR_DETAILS: Record<string, { path: string; message: string }> = {
  'already-exists': {
    path: 'email',
    message: 'E-post adressen är redan registrerad',
  },
  'incorrect-old-password': {
    path: 'oldPassword',
    message: 'Ditt gamla lösenord stämmer inte',
  },
  'not-meet-requirements': {
    path: 'password',
    message:
      'Lösenordet måste innehålla minst 8 tecken, minst en stor bokstav, minst en liten bokstav och minst en siffra.',
  },
};

const handleErrorResponse = async (response: Response) => {
  let msg;
  try {
    msg = await response.json();
  } catch (error) {
    console.error('Error parsing JSON:', error);
    return {
      errors: {
        global: UNKNOWN_ERROR.message,
      },
    };
  }

  if (typeof msg !== 'object' || msg === null) {
    return {
      errors: {
        global: UNKNOWN_ERROR.message,
      },
    };
  }

  const errorCode = msg.error || msg.message || '';

  if (ERROR_DETAILS[errorCode]) {
    const { path, message } = ERROR_DETAILS[errorCode];
    return {
      errors: {
        [path]: message,
      },
    };
  }

  return {
    errors: {
      global: UNKNOWN_ERROR.message,
    },
  };
};

const getAuthorizedHeaders = () => {
  const getAuthToken = cookies().get(
    isProduction ? '__Secure-next-auth.session-token' : 'next-auth.session-token'
  )?.value;

  return {
    Authorization: `Bearer ${getAuthToken}`,
    'Content-Type': 'application/json',
    Prefer: 'return=representation',
  };
};

export const getUser = async (email: string | null | undefined): Promise<UserResponse> => {
  const session = await getServerSession(authOptions);

  if (!session?.user.email) {
    return {
      success: {},
    };
  }

  try {
    const res = await fetch(`${config.apiEndpoint}/users?email=eq.${email}`, {
      method: 'GET',
      headers: getAuthorizedHeaders(),
    });

    const user = await res.json();

    if (!res.ok) {
      throw new Error(user.message);
    }

    return { success: { user: user[0] } };
  } catch (error) {
    console.error({
      message: 'Network error or unhandled case',
      error,
    });
    return { errors: { global: UNKNOWN_ERROR.message } };
  }
};

export const signUp = async (user: SignUpSchema): Promise<UserResponse> => {
  try {
    const endpoint =
      !user.provider || user.provider === 'credentials' ? 'signup' : 'signup_provider';
    const res = await fetch(`${config.apiEndpoint}/rpc/${endpoint}`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(user),
    });

    if (!res.ok) {
      return await handleErrorResponse(res);
    }

    revalidatePath('/');

    return { success: {} };
  } catch (error: unknown) {
    console.error({
      message: 'Network error or unhandled case',
      error,
    });
    return { errors: { global: UNKNOWN_ERROR.message } };
  }
};

export const resetPassword = async (user: PasswordChangeSchema): Promise<UserResponse> => {
  try {
    const res = await fetch(`${config.apiEndpoint}/rpc/reset_password`, {
      method: 'POST',
      headers: getAuthorizedHeaders(),
      body: JSON.stringify({
        email: user.email,
        old_password: user.oldPassword,
        new_password: user.password,
      }),
    });

    if (!res.ok) {
      return await handleErrorResponse(res);
    }

    return { success: {} };
  } catch (error: unknown) {
    console.error({
      message: 'Network error or unhandled case',
      error,
    });
    return { errors: { global: UNKNOWN_ERROR.message } };
  }
};

export const updateUser = async (
  user: UserSchema,
  userName: UserNameSchema
): Promise<UserResponse> => {
  try {
    const res = await fetch(`${config.apiEndpoint}/users?id=eq.${user.id}`, {
      method: 'PUT',
      headers: getAuthorizedHeaders(),
      body: JSON.stringify({
        id: user.id,
        email: userName.email,
        name: userName.name,
      }),
    });

    if (!res.ok) {
      const msg = await res.json();
      throw new Error(msg.message);
    }

    const response = await getUser(user?.email);
    const isSuccess = await handleServerErrors(response);

    if (!isSuccess) {
      return await handleErrorResponse(res);
    }

    return { success: { user: response.success?.user } };
  } catch (error) {
    console.error({
      message: 'Network error or unhandled case',
      error,
    });
    return { errors: { global: UNKNOWN_ERROR.message } };
  }
};

export const deleteUser = async (user: UserSchema): Promise<UserResponse> => {
  try {
    const res = await fetch(`${config.apiEndpoint}/users?email=eq.${user.email}`, {
      method: 'DELETE',
      headers: getAuthorizedHeaders(),
    });

    const json = await res.json();
    if (!res.ok || !json.length || !json[0] || !json[0].id) {
      return await handleErrorResponse(res);
    }

    return { success: {} };
  } catch (error) {
    console.error({
      message: 'Network error or unhandled case',
      error,
    });
    return { errors: { global: UNKNOWN_ERROR.message } };
  }
};
