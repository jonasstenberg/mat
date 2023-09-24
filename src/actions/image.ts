import { join } from 'path';
import { fileTypeFromBuffer } from 'file-type';
import { stat, mkdir, writeFile, unlink, readFile } from 'fs/promises';
import sharp from 'sharp';
import { v4 as uuidv4 } from 'uuid';

const UPLOAD_DIR = join(process.cwd(), 'public', 'uploads');
const MAX_FILE_SIZE = 5 * 1024 * 1024; // 5 MB

const isValidImage = async (fileBuffer: Buffer) => {
  const type = await fileTypeFromBuffer(fileBuffer);
  return type && type.mime.startsWith('image/');
};

export const deleteImage = async (image: string) => {
  const imagePath = join(UPLOAD_DIR, image);

  try {
    await unlink(imagePath);
  } catch (err: unknown) {
    console.error(
      "Couldn't delete the image. It might not exist or there might be a permission issue.",
      err
    );
  }
};

export const resizeExistingImage = async (filename: string): Promise<string> => {
  const inputPath = join(UPLOAD_DIR, filename);
  const fileBuffer = await readFile(inputPath);

  if (!(await isValidImage(fileBuffer))) {
    throw new Error('Invalid file content');
  }

  const sharpFile = sharp(fileBuffer);
  const buffer = await sharpFile.resize(600, 450).withMetadata().toBuffer();

  await writeFile(inputPath, buffer); // Overwrite the existing image

  return filename;
};

export const uploadNewImage = async (image: Blob, oldImage?: string): Promise<string> => {
  const id = uuidv4();
  const filename = `${id}.webp`;
  const outputPath = join(UPLOAD_DIR, filename);

  try {
    await stat(UPLOAD_DIR);
  } catch (e: any) {
    if (e.code === 'ENOENT') {
      await mkdir(UPLOAD_DIR, { recursive: true });
    } else {
      throw new Error("Couldn't create upload directory");
    }
  }

  const fileBuffer = Buffer.from(await image.arrayBuffer());

  if (fileBuffer.byteLength > MAX_FILE_SIZE) {
    throw new Error('File is too large');
  }

  if (!(await isValidImage(fileBuffer))) {
    throw new Error('Invalid file content');
  }

  await writeFile(outputPath, fileBuffer);

  await resizeExistingImage(filename);

  if (oldImage) {
    await deleteImage(oldImage);
  }

  return filename;
};

export const uploadNewImageFromUrl = async (url: string): Promise<string> => {
  try {
    const response = await fetch(url);
    const blob = await response.blob();

    const filename = await uploadNewImage(blob);

    return filename;
  } catch (error) {
    throw new Error("Couldn't fetch image");
  }
};
