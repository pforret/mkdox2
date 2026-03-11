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
- **Template system**: `templates/simple/` and `templates/with_blog/` use `{PLACEHOLDER}` variables substituted via awk
- **Config detection**: prefers `zensical.toml` (TOML), falls back to `mkdocs.yml` (YAML) for backward compatibility
- **Strict mode**: `set -uo pipefail` with trap-based error reporting
- **.env override**: Environment variables in `.env` override all option defaults

### Docker image

The Docker image `pforret/mkdox-zensical` (extends `zensical/zensical` with third-party plugins) is managed in `docker/`. Shares the repo-level `VERSION.md` version.

- `docker/Dockerfile` — image definition
- `docker/push_docker.sh` — build and push to Docker Hub

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
