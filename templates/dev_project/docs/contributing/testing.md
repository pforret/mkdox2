# Testing

## Run the suite

```bash
make test
```

## Layers

| Layer | Where | When |
| --- | --- | --- |
| Unit | `tests/unit` | every PR |
| Integration | `tests/integration` | every PR |
| End-to-end | `tests/e2e` | every PR (smoke) + nightly (full) |

## Conventions

- Test file mirrors source file: `app/foo.rb` → `tests/unit/foo_test.rb`
- One assertion per test, when reasonable
- Integration tests hit a real database (no mocking the DB)
- E2E tests run against a freshly migrated schema and seeded data

## Coverage

- We track coverage but don't gate on it. Aim for "exercises the interesting branches", not a percentage.

## Fixtures and factories

- Use factories, not raw fixtures.
- Avoid global state — each test owns its data.

## When a test fails in CI but passes locally

Most common causes:

- Time zone (CI runs UTC) — pin times explicitly.
- File ordering — don't rely on directory iteration order.
- Leaky background jobs — see [Jobs](../reference/jobs.md).

If you can't reproduce, see [Runbook](../operations/runbook.md).
