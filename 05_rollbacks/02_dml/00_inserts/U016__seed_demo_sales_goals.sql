UPDATE auth.app_user
SET sales_goal_cents = NULL, updated_at = now()
WHERE id IN (
    'aaaa0001-0000-4000-8000-000000000001',
    'aaaa0001-0000-4000-8000-000000000002'
);
