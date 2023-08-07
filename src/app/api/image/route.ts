import { join } from 'path';
import { stat, mkdir, readFile, writeFile, unlink } from 'fs/promises';
import sharp from 'sharp';
import { fileTypeFromBuffer } from 'file-type';
import { NextRequest, NextResponse } from 'next/server';

import { getToken } from 'next-auth/jwt';

export async function GET(req: NextRequest) {
  const filename = req.nextUrl.searchParams.get('filename');

  if (!filename) {
    return new Response('Filename must be provided', { status: 400 });
  }

  const imagePath = join(process.cwd(), 'public', 'uploads', filename);

  try {
    const fileBuffer = await readFile(imagePath);

    return new Response(fileBuffer, {
      status: 200,
      headers: {
        'Content-Type': 'image/webp',
        'Content-Length': String(fileBuffer.length),
      },
    });
  } catch (err) {
    return new Response('File not found', { status: 404 });
  }
}

export async function POST(req: NextRequest) {
  const typeOfImageVariable = req.nextUrl.searchParams.get('typeOfImageVariable');
  if (typeOfImageVariable === 'string') {
    return NextResponse.json({}, { status: 200 });
  }

  const token = await getToken({ req, raw: true });

  if (!token) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const uploadDir = join(process.cwd(), 'public', 'uploads');

  try {
    await stat(uploadDir);
  } catch (e: any) {
    if (e.code === 'ENOENT') {
      await mkdir(uploadDir, { recursive: true });
    } else {
      return NextResponse.json({ error: 'Something went wrong.' }, { status: 500 });
    }
  }

  try {
    const filename = `${req.nextUrl.searchParams.get('recipe_id')}.webp`;
    const outputPath = join(uploadDir, filename);

    const formData = await req.formData();

    const file = formData.get('file') as Blob | null;

    if (!file) {
      try {
        unlink(outputPath);
      } catch (e: unknown) {
        return NextResponse.json({ error: 'Something went wrong.' }, { status: 500 });
      }
      return NextResponse.json({ filename: null, status: 200 });
    }

    if (file.size > 5 * 1024 * 1024) {
      return NextResponse.json({ error: 'File is too large' }, { status: 400 });
    }

    const fileBuffer = await file.arrayBuffer();

    const type = await fileTypeFromBuffer(fileBuffer);

    if (!type || !type.mime.startsWith('image/')) {
      return NextResponse.json({ error: 'Invalid file content' }, { status: 400 });
    }

    const buffer = await sharp(fileBuffer).resize(600).withMetadata().toBuffer();

    await writeFile(outputPath, buffer);

    return NextResponse.json({ filename, status: 200 });
  } catch (e: unknown) {
    return NextResponse.json({ error: 'Something went wrong.' }, { status: 500 });
  }
}
