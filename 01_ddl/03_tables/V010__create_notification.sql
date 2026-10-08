-- notification: a message for one user. read_at is set once, by that same user, and never cleared.
CREATE TABLE auth.notification (
    id         uuid        NOT NULL,
    user_id    uuid        NOT NULL,
    type       text        NOT NULL,
    message    text        NOT NULL,
    read_at    timestamptz,
    created_at timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT pk_notification PRIMARY KEY (id),
    CONSTRAINT chk_notification_type CHECK (type IN ('SALES_GOAL_REACHED')),
    CONSTRAINT chk_notification_message CHECK (char_length(message) BETWEEN 1 AND 300)
);

COMMENT ON TABLE auth.notification IS 'A notification for one user, for example reaching a sales goal.';
COMMENT ON COLUMN auth.notification.user_id IS 'The app_user this notification is for; verified by contract, not a foreign key, so history survives a deleted user.';
