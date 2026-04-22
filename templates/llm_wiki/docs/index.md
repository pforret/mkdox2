# {SITE_NAME}

A persistent, LLM-maintained wiki. You curate sources and ask questions; the agent compiles, cross-references and keeps everything current.

> Inspired by [Andrej Karpathy's LLM Wiki](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f).

## Catalog

This page is **content-oriented** — a catalog of every page in the wiki, with a one-line description.

### Foundations

- [Schema](schema.md) — conventions the agent follows when ingesting, querying or linting
- [Log](log.md) — chronological record of every operation
- [Architecture](architecture/index.md) — three-layer model: sources → wiki → schema

### Architecture

- [Raw sources](architecture/sources.md) — the immutable input layer
- [The wiki](architecture/wiki.md) — what the agent owns and writes
- [Tools](architecture/tools.md) — optional CLI helpers (search, indexing)

### Operations

- [Operations overview](operations/index.md)
- [Ingest](operations/ingest.md) — process a new source into the wiki
- [Query](operations/query.md) — answer a question, optionally file the answer back
- [Lint](operations/lint.md) — health-check for contradictions, staleness, orphans

### Knowledge layers

- [Sources](sources/index.md) — index of raw documents
- [Entities](entities/index.md) — people, places, things, products
- [Concepts](concepts/index.md) — ideas, theories, frameworks

> created on {CREATION_DATE} by {USERNAME}
