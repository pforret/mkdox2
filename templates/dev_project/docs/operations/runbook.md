# Runbook

Common tasks, in copy-paste form.

## Tail production logs

```bash
# replace with your hosting provider's command
fly logs -a {SITE_NAME}
```

## Open a production console

```bash
fly ssh console -a {SITE_NAME}
```

> Read-only by default. For writes, pair with another engineer.

## Replay a failed background job

```bash
# from the app console
Job::find(<id>)->retry
```

See [Jobs](../reference/jobs.md) for queue layout.

## Reset a user's password

1. Find the user via [endpoints](../reference/endpoints.md) or DB.
2. Trigger a password-reset email from the admin panel.
3. Log the action in the incident log if reset was due to compromise.

## Database backup / restore

- Backups: nightly, 14-day retention, location: _..._
- Restore: see [Incidents](incidents.md)

## Common dev issues

| Symptom | Likely cause | Fix |
| --- | --- | --- |
| `connection refused` on boot | DB not running | `docker compose up -d` |
| Tests hang | dangling browser process | `pkill -f chromedriver` |
| Migrations fail | schema drift | `make db.reset` (dev only) |
