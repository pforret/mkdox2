# Log

Chronological, append-only. Every [ingest](operations/ingest.md), [query](operations/query.md) and [lint](operations/lint.md) pass leaves a one-line entry here.

## Format

Each entry starts with a consistent prefix so the log stays parseable with `grep`:

```
## [YYYY-MM-DD] <op> | <one-line description>
```

Quick recent-entries query:

```bash
grep "^## \[" log.md | tail -10
```

## Entries

## [{CREATION_DATE}] init | wiki initialised by {USERNAME}

- Created [schema](schema.md), [architecture](architecture/index.md) and [operations](operations/index.md) pages.
- Empty [sources](sources/index.md), [entities](entities/index.md) and [concepts](concepts/index.md) indexes ready for first ingest.
