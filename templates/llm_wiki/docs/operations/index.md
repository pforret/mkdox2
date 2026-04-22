# Operations

The three operations the agent performs. Everything else is a composition of these.

## The three operations

- [Ingest](ingest.md) — process a new [source](../architecture/sources.md) into the wiki
- [Query](query.md) — answer a question against the wiki
- [Lint](lint.md) — health-check for contradictions, staleness, orphans

Each operation appends an entry to [Log](../log.md).

## Cadence

- **Ingest:** whenever you drop a source into the raw collection.
- **Query:** any time. Good answers should be filed back as new pages.
- **Lint:** periodically — weekly or after every 10–20 ingests.

## Rules

All operations follow the [schema](../schema.md). If a rule is missing or ambiguous, the agent should pause and ask the human, then propose a schema update.
