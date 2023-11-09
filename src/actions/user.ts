'use server';

import { revalidatePath } from 'next/cache';
import { cookies } from 'next/headers';
import { getServerSession } from 'next-auth';
import { PasswordChangeSchema, UserSchema, UserProfileSchema } from '@/types/user';
import { config } from '@/utils/config';
import { validateServerResponse } from '@/utils/handleServerErrors';
import { UNKNOWN_ERROR } from '@/utils/errors';
import { authOptions } from '@/app/api/auth/[...nextauth]/route';
import { Result, ResultVoid } from '@/utils/result';

const getAuthorizedHeaders = () => {
  const getAuthToken = cookies().get(`${config.cookieSecurePrefix}next-auth.session-token`)?.value;

  return {
    Authorization: `Bearer ${getAuthToken}`,
    'Content-Type': 'application/json',
    Prefer: 'return=representation',
  };
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
      global: UNKNOWN_ERROR.message,
    };
  }

  if (typeof msg !== 'object' || msg === null) {
    return {
      global: UNKNOWN_ERROR.message,
    };
  }

  const errorCode = msg.error || msg.message || '';

  if (ERROR_DETAILS[errorCode]) {
    const { path, message } = ERROR_DETAILS[errorCode];
    return {
      [path]: message,
    };
  }

  return {
    global: UNKNOWN_ERROR.message,
  };
};

export const getUser = async (email: string | null | undefined): Promise<Result<UserSchema>> => {
  const session = await getServerSession(authOptions);

  if (!session?.user.email) {
    return {
      success: false,
      errors: {
        global: 'User not logged in',
      },
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

    return { success: true, value: user[0] };
  } catch (error) {
    console.error({
      message: 'Network error or unhandled case',
      error,
    });
    return { success: false, errors: { global: UNKNOWN_ERROR.message } };
  }
};

export const signUp = async (
  name: string,
  email: string,
  provider: string | null,
  password?: string
): Promise<ResultVoid> => {
  try {
    const isCredentialsProvider = !provider || provider === 'credentials';

    const endpoint = isCredentialsProvider
      ? `${config.apiEndpoint}/rpc/signup`
      : `${config.apiEndpoint}/rpc/signup_provider`;

    const user = isCredentialsProvider
      ? { name, email, provider }
      : { name, email, provider, password };

    const res = await fetch(endpoint, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(user),
    });

    if (!res.ok) {
      return {
        success: false,
        errors: await handleErrorResponse(res),
      };
    }

    revalidatePath('/');

    return { success: true };
  } catch (error: unknown) {
    console.error('Error signing up:', error);
    return { success: false, errors: { global: UNKNOWN_ERROR.message } };
  }
};

export const resetPassword = async (user: PasswordChangeSchema): Promise<ResultVoid> => {
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
      return {
        success: false,
        errors: await handleErrorResponse(res),
      };
    }

    return { success: true };
  } catch (error: unknown) {
    console.error({
      message: 'Network error or unhandled case',
      error,
    });
    return { success: false, errors: { global: UNKNOWN_ERROR.message } };
  }
};

export const updateUser = async (
  user: UserSchema,
  userName: UserProfileSchema
): Promise<Result<UserSchema>> => {
  try {
    const res = await fetch(`${config.apiEndpoint}/users?id=eq.${user.id}`, {
      method: 'PUT',
      headers: getAuthorizedHeaders(),
      body: JSON.stringify({
        id: user.id,
        email: userName.email,
        name: userName.name,
        measures_system: userName.measures_system,
      }),
    });

    if (!res.ok) {
      const msg = await res.json();
      throw new Error(msg.message);
    }

    const response = await getUser(user?.email);
    const isSuccess = validateServerResponse(response);

    if (!isSuccess) {
      return {
        success: false,
        errors: await handleErrorResponse(res),
      };
    }

    return response;
  } catch (error) {
    console.error({
      message: 'Network error or unhandled case',
      error,
    });
    return { success: false, errors: { global: UNKNOWN_ERROR.message } };
  }
};

export const deleteUser = async (user: UserSchema): Promise<ResultVoid> => {
  try {
    const res = await fetch(`${config.apiEndpoint}/users?email=eq.${user.email}`, {
      method: 'DELETE',
      headers: getAuthorizedHeaders(),
    });

    const json = await res.json();
    if (!res.ok || !json.length || !json[0] || !json[0].id) {
      return {
        success: false,
        errors: await handleErrorResponse(res),
      };
    }

    return { success: true };
  } catch (error) {
    console.error({
      message: 'Network error or unhandled case',
      error,
    });
    return { success: false, errors: { global: UNKNOWN_ERROR.message } };
  }
};
