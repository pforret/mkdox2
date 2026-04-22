# Setup

How to wire this vault into Claude so it acts like an employee, not a chatbot.

## 1. The vault

This site is your vault. The same markdown files can be opened in Obsidian or any editor. Put the folder in Google Drive, Dropbox or iCloud so every workstation has the same context.

## 2. Transcription pipeline

Pick any tool that exports transcripts to a folder Claude can read:

- Fathom + Zapier → Google Drive
- Otter, Fireflies → cloud folder
- Google Meet / Zoom built-in recording → manual export

Drop transcripts into [Transcripts](transcripts/index.md). The AI reads, summarises, and files actions/decisions per the routing rules in [Memory](memory.md).

## 3. MCP connectors

Connect Claude to your tools via MCP:

- **Obsidian MCP** — read/write access to this vault
- **Google Drive** — transcripts and shared docs
- **Slack** — team conversations
- **Google Calendar** — schedule context
- **Gmail** — inbox triage

## 4. Custom instructions

Add this single line to Claude's user preferences / project instructions:

> Before answering any question, always search the vault for relevant notes. Use what you find to inform your response. Read [Memory](memory.md) at the start of every session.

That's the unlock. Everything else compounds from there.

## 5. Daily flow

- Morning: ask "what do I have today and what's outstanding?"
- After each call: drop the transcript, ask Claude to process it
- End of day: ask Claude to summarise decisions and file them
