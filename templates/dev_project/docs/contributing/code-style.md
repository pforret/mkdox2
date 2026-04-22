# Code style

## Formatters and linters

| Tool | What it does | Command |
| --- | --- | --- |
| _e.g. Pint / RuboCop / Prettier_ | format code | `make format` |
| _e.g. PHPStan / Sorbet / ESLint_ | static analysis | `make lint` |

CI runs both. Failures block merge.

## House rules

- Prefer plain functions/methods over deep class hierarchies.
- Name things by what they do, not by their pattern (`SendInvoice`, not `InvoiceServiceImpl`).
- No dead code — delete unused branches in the same PR.
- Comments explain *why*, not *what*. The code already shows the *what*.
- One concern per PR.

## Naming

- Files: `snake_case.{rb,php}` or per-language convention.
- Classes: `PascalCase`.
- DB columns: `snake_case`, plural for collections (`tags`), singular for booleans (`is_admin`).

## When to break a rule

Open a PR comment explaining why. If the exception is going to recur, raise an [ADR](../architecture/decisions/index.md) to update the rule.
