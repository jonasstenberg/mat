DROP ROLE IF EXISTS "jonas@stenberg.io";
CREATE ROLE "jonas@stenberg.io" INHERIT;
GRANT "mat-admin" TO "jonas@stenberg.io";
GRANT "registered" TO "jonas@stenberg.io";
