# opti-auth-db

> auth bounded context: database (schema, seeds, migrations)

Part of the **LMS Library** distributed system — team `lms-library`, Grupo 2.
Governance and documentation live in [`library-docs`](https://github.com/code-corhuila/library-docs).

## Branching

Three permanent branches. **None of them accepts a direct commit** — you enter through a child
branch and leave through a Pull Request.

```
develop  <--PR--  feat/... fix/... chore/...
qa       <--PR--  qa/...
main     <--PR--  release/...  hotfix/...
```

Promotion happens **by re-application** (`git cherry-pick -x`), never by merging one permanent
branch into another: `merge develop -> qa` and `merge qa -> main` do not exist in this model.

`main` requires **1 approval from `ariel5253`**. On `develop` and `qa` the team sets its own review
rule.

Full policy: `00-governance/branching-policy.md` in `library-docs`.

## Local accounts

Historical demo accounts are disabled by V019 if their hashes still match the seeded values.
Keep `SEED_DEMO_DATA=false` for a clean installation. With the auth database owner, provision
one local administrator using `psql` after migration. Enter a unique, randomly generated local
password at the prompt (never reuse a real credential). The prompt is visible in your terminal;
do this privately, outside screen sharing or recording.

```sql
\prompt 'Unique password for the local administrator: ' opti_local_password
INSERT INTO auth.app_user (id, username, full_name, password_hash, role)
VALUES (gen_random_uuid(), 'demo.operator', 'Operador Demo',
        crypt(:'opti_local_password', gen_salt('bf', 12)), 'ADMIN');
\unset opti_local_password
```

Sign in as `demo.operator` and use the application to add test users. Use only fictional data.
V019 leaves accounts with already rotated credentials unchanged. Do not edit old Flyway migrations.
