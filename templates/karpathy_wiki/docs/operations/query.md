# Query

Answer a question against the wiki.

## Flow

1. **Read** the [catalog](../index.md) to find relevant pages.
2. **Drill** into matching [entities](../entities/index.md), [concepts](../concepts/index.md) and [source summaries](../sources/index.md).
3. **Synthesise** an answer with citations back to the pages used.
4. **Decide:** is this answer worth keeping?

## File answers back

The most important habit. A good answer should not disappear into chat history.

- A comparison → save as a new [concept](../concepts/index.md) page
- An analysis of an entity → append to that [entity](../entities/index.md) page
- A new connection between concepts → add cross-links and a `## Connections` section

This is how exploration compounds into knowledge.

## Output formats

The agent picks the format that fits:

- Markdown page (the default)
- Comparison table
- Marp slide deck
- Matplotlib chart
- Mermaid diagram (renderable by this site)

## Logging

Every query that produces a filed page also appends a log entry: `## [YYYY-MM-DD] query | <question> → <new page>`.
