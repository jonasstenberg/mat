CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

ALTER DATABASE mat SET timezone TO 'UTC';
ALTER DEFAULT PRIVILEGES REVOKE EXECUTE ON FUNCTIONS FROM PUBLIC;

DROP ROLE IF EXISTS "anon";

CREATE ROLE "anon";

GRANT "anon" TO "jonasstenberg";

CREATE OR REPLACE FUNCTION set_timestamptz ()
    RETURNS TRIGGER
    AS $$
BEGIN
    NEW.date_modified = now()::timestamptz;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
