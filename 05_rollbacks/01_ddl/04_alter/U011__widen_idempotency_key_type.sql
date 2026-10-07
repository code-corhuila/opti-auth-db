ALTER TABLE auth.idempotency_key DROP CONSTRAINT IF EXISTS chk_idempotency_key_type;
ALTER TABLE auth.idempotency_key ADD CONSTRAINT chk_idempotency_key_type CHECK (resource_type IN ('APP_USER'));
