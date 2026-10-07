GRANT USAGE ON SCHEMA auth TO auth_reader, auth_writer;
GRANT SELECT ON ALL TABLES IN SCHEMA auth TO auth_reader;
GRANT SELECT, INSERT, UPDATE ON auth.app_user TO auth_writer;
GRANT SELECT, INSERT ON auth.idempotency_key TO auth_writer;
