![Changelog v1.0.0](https://img.shields.io/badge/CHANGELOG-v1.0.0-orange) 
# CHANGELOG
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Fixed
- Errors now exit with a non-zero status: `IO:die` exits with 1 (or with the original status from the error trap) instead of always 0, so `mkdox2 build && deploy` and CI can detect failures
- `mkdox2 build -I` generated its index pages with the old `mkdox` tool (or failed without it); it now uses mkdox2's own `toc`
- Templates and help text named the old `pforret/mkdox` tool; they now say `pforret/mkdox2`
- `docs/zensical/compatibility.md`: plugin table corrected against Zensical's plugin page (git-revision-date-localized, git-authors and git-committers are still planned, not built in)

## [2.2.0] - 2026-11-01
### Changed
- Docker image `pforret/mkdox-zensical` updated from Zensical 0.0.24 to 0.0.74 (base now pinned, Alpine-based)
- Image is now multi-arch (linux/amd64 + linux/arm64) and tagged `:latest` + `:0.0.74`
- `mkdox2 new|build|serve` no longer force `--platform linux/amd64`: native speed on Apple Silicon
- Hints after `mkdox2 new` now say `mkdox2 serve` instead of `mkdox serve`
- Already have the old image? Run `docker pull pforret/mkdox-zensical` to get the new one
- `mkdox2 new`: the template menu shows only `simple` (default on Enter), `with_blog` and `karpathy_wiki`; other templates via `-B <name>`. The template is chosen before anything is created
### Removed
- `mkdox2 blog`: Zensical's built-in blog plugin now generates the blog index, archive and category pages (it duplicated them)
- `awesome-pages` plugin entry from all templates (Zensical doesn't load it)
### Fixed
- CI workflows (shellcheck, bash_unit) run on `main` (they only triggered on `master`)
- New projects get `site_url = "https://<name>.test/"` (was without a scheme in with_blog, which broke RSS links, and `http://` elsewhere); `{SITE_URL}` stays the bare host name
- Template plugin pages and hints said `mkdox serve` and listed awesome-pages/with-pdf
### Added
- `with_blog` template: `docs/blog/.authors.yml`, authors on posts, and a `draft: true` example post
- All templates: Zensical plugins `llmstxt` (llms.txt + "Copy as Markdown"), `tags` (with a `tags.md` index), `glightbox`, `privacy` (self-hosted Google Fonts), `minify`, `social` (link preview cards) and `callouts` (`> [!NOTE]`), with small examples
- All templates: a `.gitignore` for `site/` and `.cache/`

## [0.1.1] - 2024-01-09
### Added/changed
- MOD: mkdox2.sh
- first working version
- MOD: .gitignore mkdox2.sh 
## [0.0.1] - 2024-01-09
### Added
- create mkdox with [pforret/bashew](https://github.com/pforret/bashew)
