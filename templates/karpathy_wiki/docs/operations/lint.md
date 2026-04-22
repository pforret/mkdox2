# Lint

Periodic health-check. Run weekly, or after every 10–20 [ingests](ingest.md).

## What to look for

| Issue | Where to check |
| --- | --- |
| Contradictions between pages | flagged in `> ⚠️ Contradicts` blockquotes |
| Stale claims superseded by newer sources | check `updated` frontmatter against [log](../log.md) |
| Orphan pages with no inbound links | every page should be reachable from [the catalog](../index.md) |
| Missing cross-references | concepts that mention each other but don't link |
| Important concepts mentioned but lacking a page | grep the wiki for repeating terms |
| Data gaps that could be filled with a web search | the agent should propose new [sources](../architecture/sources.md) to ingest |

## Output

The lint pass produces a single report. The human triages and either:

- Asks the agent to fix items directly
- Adds new ingests to fill the gaps
- Updates the [schema](../schema.md) if a recurring issue suggests a rule change

## Logging

Every lint pass appends an entry: `## [YYYY-MM-DD] lint | <N> issues found, <M> fixed`.
