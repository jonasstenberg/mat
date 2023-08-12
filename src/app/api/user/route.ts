import { NextRequest, NextResponse } from 'next/server';
import { getToken } from 'next-auth/jwt';
import { getServerSession } from 'next-auth';

import { authOptions } from '@/app/api/auth/[...nextauth]/route';
import { config } from '@/utils/config';
import { UserProps } from '@/types/user';

export async function POST(req: NextRequest) {
  const untypedUser = await req.json();
  const user: UserProps = untypedUser;

  try {
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

    const json = await res.json();

    if (!res.ok) {
      throw new Error(`Response not ok ${res.status}, ${JSON.stringify(json)}`);
    }

    return NextResponse.json(json, { status: 200 });
  } catch (err) {
    console.error(err);
    return NextResponse.json({ error: 'Something went wrong.' }, { status: 500 });
  }
}

export async function PUT(req: NextRequest) {
  const token = await getToken({ req, raw: true });

  if (!token) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const r = await req.json();
  const {
    email,
    old_password,
    new_password,
  }: { email: string; old_password: string; new_password: string } = r;

  try {
    const res = await fetch(`${config.apiEndpoint}/rpc/reset_password`, {
      method: 'POST',
      headers: {
        Authorization: `Bearer ${token}`,
        'Content-Type': 'application/json',
        Prefer: 'return=representation',
      },
      body: JSON.stringify({
        email,
        old_password,
        new_password,
      }),
    });

    if (!res.ok) {
      const msg = await res.json();
      return NextResponse.json({ error: msg.message }, { status: 400 });
    }

    return NextResponse.json({}, { status: 200 });
  } catch (err) {
    console.error(err);
    return NextResponse.json({ error: 'Something went wrong.' }, { status: 500 });
  }
}

export async function DELETE(req: NextRequest) {
  const token = await getToken({ req, raw: true });
  const session = await getServerSession(authOptions);

  if (!token) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  try {
    const res = await fetch(`${config.apiEndpoint}/users?email=eq.${session?.user.email}`, {
      method: 'DELETE',
      headers: {
        Authorization: `Bearer ${token}`,
        'Content-Profile': 'auth',
        'Content-Type': 'application/json',
        Prefer: 'return=representation',
      },
    });

    const json = await res.json();
    if (!json.length || !json[0] || !json[0].id) {
      return NextResponse.json({ error: 'Something went wrong.' }, { status: 500 });
    }

    return NextResponse.json({}, { status: 200 });
  } catch (err) {
    console.error(err);
    return NextResponse.json({ error: 'Something went wrong.' }, { status: 500 });
  }
}
