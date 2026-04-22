# Endpoints

The HTTP API surface. Group by resource. Each entry: method, path, purpose, auth, params, response shape.

## Health

### `GET /health`

- **Auth:** none
- **Response:** `{ "ok": true, "version": "x.y.z" }`

## Users

### `GET /api/users/{id}`

- **Auth:** session ([Auth](auth.md))
- **Params:** `id` — user id (path)
- **Response:**
  ```json
  { "id": 1, "name": "...", "email": "..." }
  ```

### `POST /api/users`

- **Auth:** admin
- **Body:**
  ```json
  { "name": "...", "email": "..." }
  ```
- **Response:** `201 Created` with the new user

----

> Convention: every endpoint listed here maps to an entry in [data model](data-model.md) and may enqueue work via [background jobs](jobs.md). Significant API changes should appear in the [changelog](../changelog.md) and may require an [ADR](../architecture/decisions/index.md).
