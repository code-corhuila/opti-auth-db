-- Demo data for DEVELOPMENT only. It runs when the placeholder seedDemoData is "true"
-- (FLYWAY_PLACEHOLDERS_SEEDDEMODATA=true, set by opti-infra/env/.env.develop.example); in qa and main it is a no-op.
-- Idempotent SALES_GOAL_REACHED samples for the demo seller and admin.
DO $seed$
BEGIN
    IF '${seedDemoData}' = 'true' THEN
        INSERT INTO auth.notification (id, user_id, type, message, read_at, created_at)
        VALUES
            ('aa0a0001-1111-4111-8111-111111111111',
             'aaaa0001-0000-4000-8000-000000000002',
             'SALES_GOAL_REACHED',
             'Alcanzaste tu meta de ventas del periodo. Buen trabajo!',
             NULL,
             now() - interval '2 days'),
            ('aa0a0002-2222-4222-8222-222222222222',
             'aaaa0001-0000-4000-8000-000000000002',
             'SALES_GOAL_REACHED',
             'Meta de ventas superada otra vez esta semana.',
             now() - interval '1 day',
             now() - interval '3 days'),
            ('aa0a0003-3333-4333-8333-333333333333',
             'aaaa0001-0000-4000-8000-000000000001',
             'SALES_GOAL_REACHED',
             'El vendedor seller alcanzo su meta de ventas.',
             NULL,
             now() - interval '1 day')
        ON CONFLICT (id) DO UPDATE SET
            message = EXCLUDED.message,
            read_at = EXCLUDED.read_at,
            created_at = EXCLUDED.created_at;
    END IF;
END
$seed$;
