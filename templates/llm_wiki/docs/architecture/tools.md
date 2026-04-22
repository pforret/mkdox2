# Tools

Optional CLI helpers. Add them when the wiki outgrows what the [catalog](../index.md) alone can handle.

## Search

At small scale (~hundreds of pages), the [catalog](../index.md) plus full-text grep is enough. As the wiki grows you'll want proper search:

- [qmd](https://github.com/tobi/qmd) — local search engine for markdown with hybrid BM25/vector and LLM re-ranking. Has both a CLI and an MCP server.
- Or vibe-code a naive search script — the agent can build it on demand.

## Embedding indexer

Only needed if you cross ~1000 pages. The catalog scales surprisingly far without one.

## Graph view

Use Obsidian's graph view (or any markdown graph viewer) to inspect the shape of the wiki — what's connected, what's orphaned, which pages are hubs.

## Slide / chart export

The agent can produce Marp slide decks and matplotlib charts from wiki content during a [Query](../operations/query.md). File them back into the wiki to keep the artifact.
