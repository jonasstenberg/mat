import { join } from 'path';
import { readFile } from 'fs/promises';
import { NextRequest } from 'next/server';

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
