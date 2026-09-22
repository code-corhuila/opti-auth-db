-- app_user: the people who use the system. ("user" is a reserved word in SQL.)
-- The password is stored only as a bcrypt hash. failed_attempts / locked_until implement the login lockout.
CREATE TABLE auth.app_user (
    id              uuid        NOT NULL,
    username        text        NOT NULL,
    full_name       text        NOT NULL,
    password_hash   text        NOT NULL,
    role            text        NOT NULL,
    active          boolean     NOT NULL DEFAULT TRUE,
    failed_attempts integer     NOT NULL DEFAULT 0,
    locked_until    timestamptz,
    created_at      timestamptz NOT NULL DEFAULT now(),
    updated_at      timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT pk_app_user PRIMARY KEY (id),
    CONSTRAINT uq_app_user_username UNIQUE (username),
    CONSTRAINT chk_app_user_username CHECK (username ~ '^[a-z0-9._-]{3,40}$'),
    CONSTRAINT chk_app_user_full_name CHECK (char_length(full_name) BETWEEN 2 AND 120),
    CONSTRAINT chk_app_user_password_hash CHECK (password_hash ~ '^\$2[aby]\$[0-9]{2}\$.{53}$'),
    CONSTRAINT chk_app_user_role CHECK (role IN ('ADMIN', 'SELLER', 'OPTOMETRIST')),
    CONSTRAINT chk_app_user_failed_attempts CHECK (failed_attempts >= 0)
);

COMMENT ON TABLE auth.app_user IS 'A person who can sign in. Roles: ADMIN, SELLER, OPTOMETRIST. Service identities are tokens, not rows.';
COMMENT ON COLUMN auth.app_user.password_hash IS 'bcrypt hash; the clear password is never stored or logged.';
COMMENT ON COLUMN auth.app_user.locked_until IS 'While in the future, sign-in is refused (5 consecutive failures lock for 15 minutes).';
