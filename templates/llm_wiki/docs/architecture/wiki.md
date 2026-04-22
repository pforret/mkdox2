# The wiki

The synthesis layer. Owned entirely by the agent. The human reads; the agent writes.

## What lives here

- [Source summaries](../sources/index.md) — one page per ingested source
- [Entity pages](../entities/index.md) — people, places, things, products
- [Concept pages](../concepts/index.md) — ideas, theories, frameworks
- Comparison pages, analysis pages, syntheses — created on demand by [Query](../operations/query.md) and filed back

## Linking discipline

Every page must:

- Be reachable from [the catalog](../index.md) directly or transitively
- Link to at least one related page
- Cite its [sources](../sources/index.md) in frontmatter

Orphan pages get flagged by [Lint](../operations/lint.md).

## What does *not* live here

- Raw documents → [sources](sources.md)
- Tooling rules → [schema](../schema.md)
- Chronological events → [log](../log.md)
