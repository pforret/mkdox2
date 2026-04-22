# Environment

Copy the example file and fill in the blanks.

```bash
cp .env.example .env
```

## Required variables

| Variable | Purpose | Example |
| --- | --- | --- |
| `APP_ENV` | Runtime environment | `local` |
| `APP_KEY` | App secret | _generated_ |
| `DATABASE_URL` | Primary DB | `postgres://localhost/{SITE_NAME}_dev` |
| `REDIS_URL` | Cache & queues | `redis://localhost:6379` |

## Optional / per-feature

| Variable | Used by | Default |
| --- | --- | --- |
| `MAIL_FROM` | outbound email | `noreply@{SITE_URL}` |
| `STORAGE_DRIVER` | file uploads | `local` |

## Secrets

Production secrets live in the deploy platform, never in `.env`. See [Deploy](../operations/deploy.md).

Next: [First run](first-run.md).
