# Install

## Prerequisites

- _Language runtime, version_ (e.g. PHP 8.3 / Ruby 3.3 / Node 20)
- _Package manager_ (composer / bundler / pnpm)
- _Database_ (Postgres / MySQL / SQLite)
- _Cache / queue_ (Redis)
- Docker (optional, for the full stack)

## Clone

```bash
git clone {REPO_URL}
cd $(basename {REPO_URL} .git)
```

## Install dependencies

```bash
# replace with the right command for the stack
make install
```

## Start services

```bash
docker compose up -d
```

Next: [Environment](environment.md).
