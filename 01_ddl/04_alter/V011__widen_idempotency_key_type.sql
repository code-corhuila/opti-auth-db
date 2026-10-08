-- Notification creation reuses the same idempotency_key table, so the allowed resource_type set
-- must widen to include it.
ALTER TABLE auth.idempotency_key DROP CONSTRAINT chk_idempotency_key_type;
ALTER TABLE auth.idempotency_key ADD CONSTRAINT chk_idempotency_key_type
    CHECK (resource_type IN ('APP_USER', 'NOTIFICATION'));
