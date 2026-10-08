-- GET /api/v1/notifications: a user's own, newest first. Table is new and empty in this release,
-- so a plain CREATE INDEX is fine.
CREATE INDEX idx_notification_user_created ON auth.notification (user_id, created_at DESC, id DESC);
