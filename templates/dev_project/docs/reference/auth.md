# Auth

Authentication and authorisation.

## Authentication

- **Mechanism:** _e.g. session cookies / OAuth / JWT_
- **Login flow:** see [endpoints](endpoints.md) (`POST /login`)
- **Password storage:** hashed with bcrypt/argon2

## Sessions

- Stored in: _Redis / DB / signed cookie_
- Expiry: _N days, sliding / fixed_

## Authorisation

Two layers:

1. **Roles** — coarse-grained (`admin`, `member`, `guest`)
2. **Policies** — per-resource checks (e.g. _can this user edit this post?_)

Policies live alongside the model. See [Data model](data-model.md) for the entities involved.

## Adding a new permission

1. Define the policy method.
2. Cover it with a test (see [Testing](../contributing/testing.md)).
3. If it changes the security model, write an [ADR](../architecture/decisions/index.md).
