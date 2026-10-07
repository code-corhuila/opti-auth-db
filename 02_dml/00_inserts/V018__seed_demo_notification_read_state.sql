-- Demo data for DEVELOPMENT only. It runs when the placeholder seedDemoData is "true"
-- (FLYWAY_PLACEHOLDERS_SEEDDEMODATA=true, set by opti-infra/env/.env.develop.example); in qa and main it is a no-op.
-- Keeps one unread and one read notification for the demo seller so the bell UI has mixed state.
DO $seed$
BEGIN
    IF '${seedDemoData}' = 'true' THEN
        UPDATE auth.notification
        SET read_at = now() - interval '1 day'
        WHERE id = 'aa0a0002-2222-4222-8222-222222222222';

        UPDATE auth.notification
        SET read_at = NULL
        WHERE id IN (
            'aa0a0001-1111-4111-8111-111111111111',
            'aa0a0003-3333-4333-8333-333333333333'
        );
    END IF;
END
$seed$;
