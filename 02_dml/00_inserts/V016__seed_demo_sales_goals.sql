-- Demo data for DEVELOPMENT only. It runs when the placeholder seedDemoData is "true"
-- (FLYWAY_PLACEHOLDERS_SEEDDEMODATA=true, set by opti-infra/env/.env.develop.example); in qa and main it is a no-op.
-- Sets sales goals on the demo admin and seller from V006 so reports and goal notifications have a baseline.
DO $seed$
BEGIN
    IF '${seedDemoData}' = 'true' THEN
        UPDATE auth.app_user
        SET sales_goal_cents = 200000000, updated_at = now()
        WHERE id = 'aaaa0001-0000-4000-8000-000000000002';

        UPDATE auth.app_user
        SET sales_goal_cents = 300000000, updated_at = now()
        WHERE id = 'aaaa0001-0000-4000-8000-000000000001';
    END IF;
END
$seed$;
