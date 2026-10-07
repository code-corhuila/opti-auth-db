-- Plain CREATE INDEX is fine here: the tables were created in this same release and are empty.
-- Any later index on a table with data goes in its own migration with CREATE INDEX CONCURRENTLY.
-- This domain has no foreign keys (no table refers to another), so there is no 04_alter migration.

-- GET /users: newest first, optionally by role or state.
CREATE INDEX idx_app_user_created ON auth.app_user (created_at DESC, id DESC);
CREATE INDEX idx_app_user_role_created ON auth.app_user (role, created_at DESC);
