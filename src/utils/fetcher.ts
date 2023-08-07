const fetcher = async (
  url: string,
  method: string,
  token: string | undefined,
  body?: string | undefined
) =>
  fetch(url, {
    method,
    headers: {
      Authorization: `Bearer ${token}`,
      'Content-Type': 'application/json',
      Prefer: 'return=representation',
    },
    body,
  });

export default fetcher;
