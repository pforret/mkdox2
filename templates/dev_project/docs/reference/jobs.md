# Background jobs

Anything slow, retryable or scheduled runs in a worker, not a web request.

## Queues

| Queue | Purpose | Concurrency |
| --- | --- | --- |
| `default` | general async work | 4 |
| `mail` | outbound email | 2 |
| `low` | best-effort cleanup | 1 |

## Jobs

### `SendWelcomeEmail`

- **Queue:** `mail`
- **Triggered by:** user signup ([endpoints](endpoints.md))
- **Side effects:** sends email, writes to `email_log`
- **Retries:** 3, exponential backoff
- **Failure:** routes to dead-letter, see [Runbook](../operations/runbook.md)

### `RebuildSearchIndex`

- **Queue:** `low`
- **Triggered by:** cron, daily 02:00 UTC
- **Side effects:** rewrites the search index

## Operating

- Workers run as a separate process — see [Deploy](../operations/deploy.md).
- Stuck or failing jobs → [Runbook](../operations/runbook.md).
