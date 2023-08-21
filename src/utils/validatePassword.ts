export const isValidPassword = (password: string): boolean => {
  const minLength = 8;

  if (password.length < minLength) {
    return false;
  }

  if (!(password.match(/[A-Z]/) && password.match(/[a-z]/))) {
    return false;
  }

  if (!password.match(/\d/)) {
    return false;
  }

  return true;
};
