# First run

## Migrate and seed

```bash
# replace with the right command for the stack
make db.setup
```

## Boot the app

```bash
make dev
```

App should be live at <http://localhost:8000>.

## Verify

- Hit the health endpoint: `curl localhost:8000/health` → `{ "ok": true }`
- Run the test suite: see [Testing](../contributing/testing.md)
- Check logs: see [Observability](../operations/observability.md)

If anything fails, see [Runbook](../operations/runbook.md) for common dev issues.
