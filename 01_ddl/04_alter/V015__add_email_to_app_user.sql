-- Optional email for a person who signs in; shown in "Mi cuenta" and the users list. Nullable because
-- existing users (including the demo ones seeded by V006) do not have one yet.
ALTER TABLE auth.app_user ADD COLUMN email text;

ALTER TABLE auth.app_user
    ADD CONSTRAINT chk_app_user_email CHECK (email IS NULL OR email ~ '^[^@\s]+@[^@\s]+\.[^@\s]{2,}$');

COMMENT ON COLUMN auth.app_user.email IS 'Optional; null until the user sets one. Validated as a well-formed address.';

-- Synthetic emails for the demo users seeded by V006__seed_demo_users.sql (develop only; a no-op
-- anywhere else since those usernames do not exist there).
UPDATE auth.app_user SET email = 'admin@optiview.com' WHERE username = 'admin';
UPDATE auth.app_user SET email = 'seller@optiview.com' WHERE username = 'seller';
UPDATE auth.app_user SET email = 'optometrist@optiview.com' WHERE username = 'optometrist';
