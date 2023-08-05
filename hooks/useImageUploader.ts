'use client';

import { useState } from 'react';

interface UseImageUploaderResult {
  image: File | null | string;
  setImage: React.Dispatch<React.SetStateAction<File | null | string>>;
  clearImage: () => void;
}

const useImageUploader = (initialImage: File | null | string): UseImageUploaderResult => {
  const [image, setImage] = useState<File | null | string>(initialImage);

  const clearImage = () => {
    setImage(null);
  };

  return {
    image,
    setImage,
    clearImage,
  };
};

export default useImageUploader;
