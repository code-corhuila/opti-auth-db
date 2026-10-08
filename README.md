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

## Demo users (development only)

`V006__seed_demo_users.sql` creates three users when `SEED_DEMO_DATA=true` (develop only);
`V014__reset_demo_user_passwords.sql` sets the password below for all three, so they can actually
be used to sign in instead of only existing as unusable bcrypt hashes.

| Username | Role | Password |
|---|---|---|
| `admin` | ADMIN | `OptiView2026` |
| `seller` | SELLER | `OptiView2026` |
| `optometrist` | OPTOMETRIST | `OptiView2026` |

Development only: never reuse this password outside a local or CI environment.
