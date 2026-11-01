# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

**mkdox** — Bash wrapper for Zensical/Material via Docker. Manages creation, serving, building, and content management of documentation sites.

Built on the **bashew** framework (pforret/bashew). Single-script architecture: `mkdox2.sh` (~1370 lines).

## Commands

```bash
# Run tests (requires bash_unit: brew install bash_unit)
./tests/run_tests.sh

# Lint
shellcheck mkdox2.sh

# Run the tool
./mkdox2.sh new <name>        # Create new project from template
./mkdox2.sh serve              # Docker dev server with hot-reload
./mkdox2.sh build              # Build static HTML via Docker
./mkdox2.sh post               # Create blog post (interactive)
./mkdox2.sh toc                # Generate table of contents
./mkdox2.sh -R -T toc          # Recursive tree TOC
./mkdox2.sh -H 3 recent        # Recently modified pages
```

## Architecture

### mkdox2.sh structure

- **Lines 33-59**: CLI option declarations via `Option:config()` — declarative flag/option/param definitions
- **Lines 65-382**: `Script:main()` — action dispatcher with 10 commands: `new`, `serve`, `build`, `post`, `images`, `recent`, `toc`, `check`, `env`, `update`
- **Lines 388-417**: Helper functions (`derive_port`, `find_md_title`, `find_md_short`)
- **Lines 420+**: Bashew framework layer — namespaced utility functions (`IO:*`, `Str:*`, `Os:*`, `Tool:*`, `Script:*`, `Option:*`)

### Key patterns

- **Namespaced functions**: `IO:print`, `Str:slugify`, `Os:require`, etc.
- **Docker for heavy lifting**: `serve` and `build` run Zensical inside `pforret/mkdox-zensical` container
- **Template system**: each folder in `templates/` (with a one-line `description.txt`) uses `{PLACEHOLDER}` variables substituted via awk. `mkdox2 new` without `-B` shows a fixed menu from the `menu_templates` array in the `new)` action: `simple` (default on Enter), `with_blog`, `karpathy_wiki`. The other templates (`ai_employee`, `committee`, `dev_project`) only via `-B <name>`. The template is chosen and checked before any folder is created or Docker runs
- **Config detection**: prefers `zensical.toml` (TOML), falls back to `mkdocs.yml` (YAML) for backward compatibility
- **Strict mode**: `set -uo pipefail` with trap-based error reporting
- **.env override**: Environment variables in `.env` override all option defaults

### Docker image

The Docker image `pforret/mkdox-zensical` (extends `zensical/zensical` with third-party plugins) is managed in `docker/`. Its tags follow the Zensical version, not `VERSION.md`: each push publishes `:latest` and `:<zensical version>` (e.g. `:0.0.74`), multi-arch (linux/amd64 + linux/arm64).

- `docker/Dockerfile` — image definition; pins `FROM zensical/zensical:<version>` (bump the Zensical version here)
- `docker/push_docker.sh` — `docker buildx` multi-arch build (via a `docker-container` builder `mkdox-builder`, created on first run) and push to Docker Hub; reads the tag from the `FROM` line
- Local test without pushing: `cd docker && docker buildx build --pull --platform linux/arm64 -t mkdox-zensical:test --load .`, then `mkdox2 -D mkdox-zensical:test ...`

### Templates vs docs

- `templates/` — Minimal docs content used by `mkdox new` to scaffold new projects
- `docs/` — Documentation for this repository itself

### Template placeholders

`{SITE_NAME}`, `{SITE_URL}`, `{REPO_URL}`, `{USERNAME}`, `{CREATION_DATE}`, `{CREATION_YEAR}`

## Dependencies

- Docker (required for serve/build)
- bash 4.0+, awk, git
- bash_unit (for tests)
- shellcheck (for linting)
