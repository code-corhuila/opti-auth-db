-- V006's own comment promised the demo passwords would be documented in this repository's README,
-- but they never were, and nobody kept the clear text behind the bcrypt hashes it inserted: nobody
-- could actually sign in as a demo user. This sets a documented, known password for all three.
-- Development only, like V006 itself.
DO $reset$
BEGIN
    IF '${seedDemoData}' = 'true' THEN
        UPDATE auth.app_user SET password_hash = '$2a$12$2qUwIBuKxqrPnYy6.JTJve7a/WEtnkbWuebQj6kMwW8D3nAXMdsou'
        WHERE username IN ('admin', 'seller', 'optometrist');
    END IF;
END
$reset$;
