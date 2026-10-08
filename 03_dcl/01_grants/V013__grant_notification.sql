-- auth.notification follows the same read/write split as app_user. Granted here, not by the
-- blanket "ALL TABLES IN SCHEMA" in V008, because that grant only covers tables that already
-- existed when it ran.
GRANT SELECT ON auth.notification TO auth_reader;
GRANT SELECT, INSERT, UPDATE ON auth.notification TO auth_writer;
