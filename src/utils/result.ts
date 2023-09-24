export type Errors = { [key: string]: string | object };
export type Result<T> = { success: true; value: T } | { success: false; errors?: Errors };
export type ResultVoid = { success: true } | { success: false; errors?: Errors };
