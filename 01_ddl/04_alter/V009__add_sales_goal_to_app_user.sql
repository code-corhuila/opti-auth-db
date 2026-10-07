-- Meaningful only for a SELLER; set by an ADMIN. The worker compares a seller's period revenue
-- (from opti-sales-api's reports) against this to decide when to notify them.
ALTER TABLE auth.app_user ADD COLUMN sales_goal_cents bigint;

COMMENT ON COLUMN auth.app_user.sales_goal_cents IS 'Sales goal in cents for a SELLER; null means no goal is set.';
