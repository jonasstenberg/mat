import { NextRequest, NextResponse } from 'next/server';
import { getToken } from 'next-auth/jwt';
import { getServerSession } from 'next-auth';

import { authOptions } from '@/app/api/auth/[...nextauth]/route';
import { config } from '@/utils/config';

export async function GET(req: NextRequest) {
  const token = await getToken({ req, raw: true });
  const session = await getServerSession(authOptions);

  if (!token) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  try {
    const res = await fetch(`${config.apiEndpoint}/users?email=eq.${session?.user.email}`, {
      method: 'GET',
      headers: {
        Authorization: `Bearer ${token}`,
        'Accept-Profile': 'auth',
        'Content-Type': 'application/json',
      },
    });

    const user = await res.json();

    if (!res.ok) {
      return NextResponse.json(
        { error: user.message },
        { status: res.status, statusText: res.statusText }
      );
    }

    return NextResponse.json(user, { status: 200 });
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
  const { id, email, name }: { id: string; email: string; name: string } = r;

  try {
    const res = await fetch(`${config.apiEndpoint}/users?id=eq.${id}`, {
      method: 'PUT',
      headers: {
        Authorization: `Bearer ${token}`,
        'Content-Profile': 'auth',
        'Content-Type': 'application/json',
        Prefer: 'return=representation',
      },
      body: JSON.stringify({
        id,
        email,
        name,
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
