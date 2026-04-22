# Ingest

Process a new [source](../architecture/sources.md) into the wiki.

## Flow

1. **Read** the raw source end-to-end.
2. **Discuss** the key takeaways with the human (skip if batch-ingesting).
3. **Write** a summary page under [Sources](../sources/index.md) with frontmatter:
   ```yaml
   ---
   type: source-summary
   source_path: ../../raw/<filename>
   ingested: YYYY-MM-DD
   ---
   ```
4. **Update** the [catalog](../index.md) with a new entry.
5. **Touch** every [entity](../entities/index.md) or [concept](../concepts/index.md) page the source affects:
    - Add new claims with citations.
    - Flag contradictions with existing claims (use a `> ⚠️ Contradicts ...` blockquote).
    - Strengthen weakly-supported claims.
6. **Create** new entity or concept pages for anything the source introduces.
7. **Append** a log entry: `## [YYYY-MM-DD] ingest | <source title>`.

## Batch ingest

For low-supervision batch mode, the agent runs steps 1, 3, 4, 5, 6, 7 — and surfaces a single summary report at the end with anything ambiguous for human review.

## Don't

- Modify the raw [source](../architecture/sources.md). Ever.
- Silently overwrite a contradiction — flag it.
- Create a wiki page that doesn't link to anything else.
