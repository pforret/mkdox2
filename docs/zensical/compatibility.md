# Zensical Compatibility with MkDocs Material

Summary of Zensical's compatibility status vs MkDocs Material for MkDocs, based on <https://zensical.org/compatibility/>.

## Features

All core MkDocs Material features are supported:

| Category                                                                    | Status    |
|-----------------------------------------------------------------------------|-----------|
| Core (install, build, serve, file layout, Jinja templates, YAML metadata)   | Supported |
| Languages (60+), header, announcement bar, footer, social links, copyright  | Supported |
| Git repo integration, code actions, tags, 404 pages                         | Supported |
| Revision dates/authors from git (`git-revision-date-localized`, `git-*`)    | Planned (see plugins below) |
| Color palettes, light/dark toggle, custom colors/schemes, fonts, icons      | Supported |
| Social cards, favicons, custom assets, template overrides                   | Supported |
| All 30+ Markdown extensions (admonitions, code blocks, Mermaid, math, etc.) | Supported |
| Blog, versioning, instant loading, search, analytics, SEO, offline usage    | Supported |

**Not yet available:** Module system (planned replacement for hooks and plugins).

## Template Overrides

Zensical uses **MiniJinja** instead of Jinja2. Key differences:

- No Python interpreter available — cannot call arbitrary Python functions
- Templates must use available filters and tests only
- Custom overrides based on Material for MkDocs **9.6.18+** should be compatible
- A component system is on the roadmap to cover gaps

## Plugin Compatibility

Zensical does not load MkDocs plugins. Instead it ships native implementations of about 30 of them,
which accept the existing configuration. Plugins that are not on its supported list are **silently
ignored**: installing their pip package (as `docker/Dockerfile` does) has no effect. Supported plugins
reject unknown settings with a configuration error.

Full, current list: <https://zensical.org/docs/compatibility/mkdocs/plugins/>. Commonly asked about
(status as of Zensical 0.0.74):

| Plugin                                  | Zensical status                                                     |
|-----------------------------------------|---------------------------------------------------------------------|
| `search`                                | Native (since 0.0.3), enabled by default                            |
| `mkdocstrings`                          | Native (since 0.0.11); needs `pip install mkdocstrings-python`      |
| `mike`                                  | Native (since 0.0.30); needs Zensical's compatible fork of mike     |
| `macros`                                | Native (since 0.0.40)                                               |
| `awesome-nav`, `literate-nav`, `meta`   | Native (since 0.0.58)                                               |
| `minify`                                | Native (since 0.0.58); `minify_html` etc. default to false          |
| `blog` / `material/blog`                | Native (since 0.0.64), port of the Material blog plugin             |
| `rss`                                   | Native (since 0.0.65), "Zensical RSS" feeds                         |
| `include-markdown`                      | Native (since 0.0.71), converted to `pymdownx.snippets`             |
| `optimize` (image compression)          | In progress, not available yet                                      |
| `git-revision-date-localized`           | **Planned**, not available yet                                      |
| `git-authors`, `git-committers`         | **Planned**, not available yet                                      |
| `gen-files`                             | Not supported: use `autoapi` or `api-autonav` instead               |
| `open-in-new-tab`                       | Not supported: add its JavaScript with `extra_javascript`           |
| `awesome-pages`                         | Not supported (not on the list): no effect, removed from the mkdox2 templates |
| `static-i18n`                           | Not supported (not on the list)                                     |
| `markdown-include` (Markdown extension) | Not loaded: `{!file.md!}` stays literal text; use `--8<--` snippets |

Blog and RSS were checked on Zensical 0.0.74 with the `with_blog` template: index, posts, archive, category pages and RSS feeds are all generated natively.

### Plugins used in the mkdox2 templates (tested on Zensical 0.0.74)

All templates enable these native plugins (see <https://zensical.org/docs/compatibility/mkdocs/plugins/>):

| Plugin      | Setting that matters                                                     | Result                                                       |
|-------------|--------------------------------------------------------------------------|--------------------------------------------------------------|
| `llmstxt`   | `sections` is required (without it `llms.txt` is silently empty)         | `llms.txt`, `llms-full.txt`, Markdown copies of pages        |
| `tags`      | listing needs `<!-- material/tags -->` on a page (`tags_file` is ignored) | `docs/tags.md` lists all tagged pages                        |
| `glightbox` | none                                                                     | images open in a lightbox                                    |
| `privacy`   | `assets_include`: without it, it self-hosts everything in the theme bundle (Pyodide, Ace, ad/video SDKs, ~7.7 MB) | Google Fonts + glightbox self-hosted (~1 MB) |
| `minify`    | `minify_html` etc. default to false (no effect without them)            | one-line HTML                                                |
| `social`    | needs `site_url` with a scheme                                           | `assets/images/social/*.png` + `og:image`; no Cairo needed   |
| `callouts`  | none                                                                     | `> [!NOTE]` rendered as an admonition                        |

- **`markdown-include`** (`{!file.md!}`) does **not** work: the build passes and the tag stays as literal text. Use `pymdownx.snippets` (`--8<-- "file.md"`), which every template enables.
- `privacy` and `social` cache downloads in `.cache/`; the first build needs network, later builds work offline.
- A docs folder named `templates/` is not built (its pages are missing from `site/`, and links to them warn "page does not exist"). The `ai_employee` template therefore keeps its templates in `docs/forms/`.
