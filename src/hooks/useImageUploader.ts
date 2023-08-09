'use client';

import { useState } from 'react';

interface UseImageUploaderResult {
  image: File | null | string;
  setImage: React.Dispatch<React.SetStateAction<File | null | string>>;
}

const useImageUploader = (initialImage: File | null | string): UseImageUploaderResult => {
  const [image, setImage] = useState<File | null | string>(initialImage);

  return {
    image,
    setImage,
  };
};

export default useImageUploader;
