# Workflow

## Branches

- `main` — always deployable, protected
- Feature branches: `<initials>/<short-description>` — short-lived, rebased onto `main`

## Pull requests

1. Open a draft PR early.
2. Keep it small — < ~400 lines diff is the sweet spot.
3. Fill in the PR template: what, why, how to test.
4. CI must pass: lint + [tests](testing.md).
5. At least one approval to merge.
6. Squash-merge to `main`.

## When to write an ADR

If the PR introduces a new architectural commitment — a new dependency, a cross-cutting pattern, a security model change — include an [ADR](../architecture/decisions/index.md) in the same PR.

## When to update the changelog

If the PR has user-visible behaviour, append an entry under `[Unreleased]` in [Changelog](../changelog.md).

## Releases

See [Deploy](../operations/deploy.md) for the cut-a-release flow.
