# Schema

The configuration document the LLM agent reads before doing anything. This is what makes the agent a disciplined wiki maintainer rather than a generic chatbot.

> Mirror this content into `CLAUDE.md` (Claude Code), `AGENTS.md` (Codex) or your agent's equivalent.

## Roles

- **Human:** curates sources, asks questions, directs synthesis.
- **Agent:** writes and maintains every file under `docs/` (except this page and [Log](log.md), which the human and agent both edit).

## Layers

See [Architecture](architecture/index.md) for the full picture.

1. [Raw sources](architecture/sources.md) — never modified by the agent
2. [The wiki](architecture/wiki.md) — owned entirely by the agent
3. [Schema](schema.md) — this file; co-evolved by human and agent

## Page conventions

- One concept per page. Prefer many small pages over a few large ones.
- Filenames: `kebab-case.md`. Folders: `lowercase`.
- Every page belongs to one of: [sources](sources/index.md), [entities](entities/index.md), [concepts](concepts/index.md).
- Every page links to at least one other page. Orphans are flagged by [Lint](operations/lint.md).
- Links use markdown form: `[term](relative/path.md)` — never wiki-style `[[term]]`.

## Frontmatter

Each agent-written page should carry minimal YAML frontmatter:

```yaml
---
type: entity | concept | source-summary
sources: [list of source-summary pages this page draws from]
updated: YYYY-MM-DD
---
```

## Operations

See the dedicated pages — these are the only three things the agent does:

- [Ingest](operations/ingest.md)
- [Query](operations/query.md)
- [Lint](operations/lint.md)
