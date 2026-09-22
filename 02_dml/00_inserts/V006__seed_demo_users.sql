-- Demo users for DEVELOPMENT only. They are created when the placeholder seedDemoData is "true"
-- (FLYWAY_PLACEHOLDERS_SEEDDEMODATA=true, set by opti-infra/env/.env.develop.example); in qa and main this
-- migration does nothing and the first administrator is created by the operator.
-- The passwords of the demo users are documented in the README of this repository. Only their bcrypt hash is stored.
DO $seed$
BEGIN
    IF '${seedDemoData}' = 'true' THEN
        INSERT INTO auth.app_user (id, username, full_name, password_hash, role)
        VALUES
            ('aaaa0001-0000-4000-8000-000000000001', 'admin', 'Administrador OptiView', '$2a$10$y0LtCkRA07lOkxgVbvjILudk83FTbLMY2Y1kHIL4Y7sKybGH3xdkq', 'ADMIN'),
            ('aaaa0001-0000-4000-8000-000000000002', 'seller', 'Vendedor OptiView', '$2a$10$fMuGu7JiQsrBOebJvWRF8OpsRNxCYa6HBo4aClm0G8EAAuBWhQSXu', 'SELLER'),
            ('aaaa0001-0000-4000-8000-000000000003', 'optometrist', 'Optometra OptiView', '$2a$10$5s/o/Vwvc/BmLma8trqVmeuMvZXT09dek835JNaYkTPanr9CHGk0K', 'OPTOMETRIST')
        ON CONFLICT (id) DO NOTHING;
    END IF;
END
$seed$;
