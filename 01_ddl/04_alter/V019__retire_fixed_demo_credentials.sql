-- Disable demo accounts only when their password still matches a historical seed.
-- Existing accounts with rotated credentials are preserved. No rows are deleted.
UPDATE auth.app_user
SET active = FALSE,
    password_hash = crypt(encode(gen_random_bytes(32), 'hex'), gen_salt('bf', 12))
WHERE id IN (
    'aaaa0001-0000-4000-8000-000000000001',
    'aaaa0001-0000-4000-8000-000000000002',
    'aaaa0001-0000-4000-8000-000000000003'
)
AND encode(digest(password_hash, 'sha256'), 'hex') IN (
    '0d2aacb4486b4ef7ecb0c7b6aa11672bef4f916ae55fd6a4ce668dc45751652d',
    '229ef7e5c28322775471b0fb24f3a9acdf7a1104558d8fb5f45535f3d4cd3a89',
    '707e88d79fa8241edc736331be2f3dc4a387a5af45963287d21f3a64371e615c',
    'a139519e7175212b4459387f710b44d616c3d5a2679507f85e6763dfccfb5edf'
);
