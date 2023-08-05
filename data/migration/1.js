const { join } = require('path');
const sharp = require('sharp');
const { writeFile } = require('fs/promises');

(async () => {
  const res = await fetch('http://127.0.0.1:3001/recipes?select=id,image');
  const json = await res.json();

  await Promise.all(
    json.map(async (row) => {
      const oldFile = join(process.cwd(), 'data', 'files', `${row.image}-840.jpg`);

      if (row.image) {
        const buffer = await sharp(oldFile).resize(600).toBuffer();

        try {
          const outputPath = join(process.cwd(), 'public', 'uploads', `${row.id}.webp`);
          await writeFile(outputPath, buffer);
        } catch (e) {
          console.log(e);
        }
      }
    })
  );
})();
