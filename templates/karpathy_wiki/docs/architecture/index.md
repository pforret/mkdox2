# Architecture

Three layers. Strict ownership. Everything else follows from this.

```
┌──────────────────────────────────────────────────┐
│ Schema (schema.md)                               │
│ ▸ rules the agent follows                        │
└──────────────────────────────────────────────────┘
            ▲ co-evolved by human + agent
┌──────────────────────────────────────────────────┐
│ The wiki (entities, concepts, source summaries)  │
│ ▸ owned by the agent, read by the human          │
└──────────────────────────────────────────────────┘
            ▲ derived from
┌──────────────────────────────────────────────────┐
│ Raw sources (immutable)                          │
│ ▸ curated by the human                           │
└──────────────────────────────────────────────────┘
```

## Layer pages

- [Raw sources](sources.md) — input layer
- [The wiki](wiki.md) — agent-owned synthesis layer
- [Tools](tools.md) — optional helpers (search, indexers)

## Why three layers?

Most RAG setups collapse the middle layer — they retrieve from raw sources at query time and never accumulate. Adding a wiki layer turns the agent into a librarian: every new source updates the synthesis, every query reads the synthesis first, and the synthesis compounds. See the [schema](../schema.md) for the rules that keep the layers honest.
