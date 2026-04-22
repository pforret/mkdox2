# 0001. Record architecture decisions

- **Status:** Accepted
- **Date:** {CREATION_DATE}
- **Deciders:** {USERNAME}

## Context

We need a lightweight way to record architectural decisions so the reasoning behind the system isn't lost in Slack threads, PR comments and people's heads.

## Decision

We will record significant architectural decisions as ADRs in [`architecture/decisions/`](index.md), following the [template](template.md). New decisions are proposed as PRs and become binding on merge.

## Consequences

- Easier onboarding — the *why* is recoverable.
- A small per-PR cost when an architectural change is in flight.
- The [decisions index](index.md) becomes the canonical list of architectural commitments.

## Alternatives considered

- **Wiki page per decision** — too easy to edit retroactively, loses the "decision in time" property.
- **Just rely on PR descriptions** — invisible to anyone who doesn't know which PR to read.

## References

- Michael Nygard's original [ADR post](https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions).
