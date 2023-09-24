import dotenv from 'dotenv';

dotenv.config({ path: '.env.local' });

class MockFile {
  name: string;

  constructor(
    parts: (string | Blob | ArrayBuffer | ArrayBufferView)[],
    filename: string,
    properties?: any
  ) {
    this.name = filename;
  }
}

// Here we assign it to global so it's available in all our tests
(global as any).File = MockFile;
