CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

ALTER DATABASE mat SET timezone TO 'UTC';
ALTER DEFAULT PRIVILEGES REVOKE EXECUTE ON FUNCTIONS FROM PUBLIC;

DROP ROLE IF EXISTS "authenticator";
DROP ROLE IF EXISTS "registered";
DROP ROLE IF EXISTS "mat-admin";
DROP ROLE IF EXISTS "anon";

CREATE ROLE "authenticator" LOGIN NOINHERIT NOCREATEDB NOCREATEROLE NOSUPERUSER;
CREATE ROLE "anon";
CREATE ROLE "registered" INHERIT;
CREATE ROLE "mat-admin" INHERIT;

GRANT "registered" TO "jonasstenberg";
GRANT "mat-admin" TO "jonasstenberg";
GRANT "anon" TO "jonasstenberg";
GRANT "anon" TO "registered";
GRANT "registered" TO "mat-admin";

CREATE OR REPLACE FUNCTION set_timestamptz ()
    RETURNS TRIGGER
    AS $$
BEGIN
    NEW.date_updated = now()::timestamptz;
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;
