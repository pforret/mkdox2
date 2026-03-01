# PRP: Migrate mkdox from MkDocs to Zensical

## Context

MkDocs 1.x is unmaintained. MkDocs 2.0 drops plugin support and is incompatible with Material for MkDocs. The Material team created **Zensical** as the successor — a Rust+Python static site generator with full Material feature parity (blog, search, extensions all built-in). Zensical uses `zensical.toml` (TOML) natively but can fall back to `mkdocs.yml`.

## Branch

Create branch `feature/zensical-migration` from master.

## Changes

### 1. `docker/Dockerfile`
- Change base image: `squidfunk/mkdocs-material:latest` → `zensical/zensical:latest`
- Update pip plugins: remove plugins now built-in to Zensical (blog, search, minify, glightbox, git-revision-date). Keep those still needed as third-party (awesome-pages, autolinks, include-markdown, rss, markdown-include). Verify at build time; remove any that fail.
- Change entrypoint from `mkdocs` → `zensical`
- Change CMD from `["serve", "--dev-addr=0.0.0.0:8000"]` → `["serve", "--dev-addr=0.0.0.0:8000"]` (same args, different binary)

### 2. `docker/push_docker.sh`
- Change image name: `pforret/mkdox-material-derived` → `pforret/mkdox-zensical`

### 3. `mkdox.sh` — Script metadata & options
- Update `script_description`: "easy wrapper for Zensical/Material in Docker mode"
- Update default Docker image option (line 49): `pforret/mkdox-material-derived` → `pforret/mkdox-zensical`

### 4. `mkdox.sh` — `new` command (~lines 72-163)
- Change Docker `new` command: `docker run ... "$DOCKER" new "$folder"` (Zensical's `new` uses same syntax)
- After scaffolding: detect if `zensical.toml` was created; if so, apply template substitution to it (same placeholders)
- Update user-facing messages: "Mkdocs Material" → "Zensical"

### 5. `mkdox.sh` — `build` command (~lines 166-213)
- Docker run command stays structurally the same: `docker run ... "$DOCKER" build`
- Remove `-e ENABLE_PDF_EXPORT` (Zensical handles this differently; flag kept but may be no-op)
- Update user-facing messages

### 6. `mkdox.sh` — `serve` command (~lines 215-244)
- Docker run command: same structure, Zensical `serve` uses same `--dev-addr` and port 8000
- Update user-facing messages

### 7. Templates — new `zensical.toml` files
- Create `templates/simple/zensical.toml` — TOML equivalent of current `mkdocs.yml` with same placeholders
- Create `templates/with_blog/zensical.toml` — TOML equivalent with blog/rss config
- Keep existing `mkdocs.yml` files for backward compatibility (existing projects)

### 8. `mkdox.sh` — config file detection
- In `serve` and `build` commands, add fallback logic:
  - If `zensical.toml` exists → use it (default, Zensical auto-detects)
  - Else if `mkdocs.yml` exists → pass `-f mkdocs.yml` to Zensical
  - Else → die with error
- In `new` command: template now creates `zensical.toml`

### 9. `mkdox.sh` — `post` command (~lines 266-295)
- Update `blog_dir` detection: check `zensical.toml` first (grep `blog_dir`), fall back to `mkdocs.yml`

### 10. Text updates across the script
- Replace "Mkdocs Material" / "MkDocs" references in user-facing messages with "Zensical"
- Update TIP comments

### 11. `CLAUDE.md` & `VERSION.md`
- Update CLAUDE.md to reflect Zensical
- Bump version (minor: 0.7.0)

## Files modified
- `docker/Dockerfile`
- `docker/push_docker.sh`
- `mkdox.sh` (main script)
- `templates/simple/zensical.toml` (new)
- `templates/with_blog/zensical.toml` (new)
- `CLAUDE.md`
- `VERSION.md`

## Verification
1. `shellcheck mkdox.sh` — no new warnings
2. `./mkdox.sh check` — runs without errors
3. Docker build: `cd docker && docker build -t pforret/mkdox-zensical .` — succeeds
4. `./mkdox.sh serve` in an existing project with `mkdocs.yml` — falls back correctly
5. `./mkdox.sh new testproject` — creates project with `zensical.toml`

## Open questions
- Which pip plugins will actually install cleanly on the Zensical base image? (will verify during Docker build)
