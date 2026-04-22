# Raw sources

The input layer. Articles, papers, PDFs, transcripts, images, data files. **Immutable** — the agent reads from here, never writes.

## Where sources live

By convention, raw sources live outside the published wiki. Two common layouts:

- A sibling `raw/` directory at the project root: `../raw/`
- A separate folder synced via your knowledge tool of choice (Obsidian, Foam, plain git)

The wiki only contains _summaries_ of sources. See [Sources index](../sources/index.md) for the catalog of source summaries.

## Adding a new source

1. Drop the file into your raw collection.
2. Trigger an [ingest](../operations/ingest.md).
3. The agent writes a summary page in [Sources](../sources/index.md), updates relevant [entities](../entities/index.md) and [concepts](../concepts/index.md), and appends an entry to [Log](../log.md).

## Tips

- Use the **Obsidian Web Clipper** to convert articles to markdown.
- Download images locally so the agent can view them directly instead of relying on URLs.
- Keep filenames descriptive — they're the first thing the agent reads.
