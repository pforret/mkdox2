# Zensical Compatibility with MkDocs Material

Summary of Zensical's compatibility status vs MkDocs Material for MkDocs, based on <https://zensical.org/compatibility/>.

## Features

All core MkDocs Material features are supported:

| Category                                                                    | Status    |
|-----------------------------------------------------------------------------|-----------|
| Core (install, build, serve, file layout, Jinja templates, YAML metadata)   | Supported |
| Languages (60+), header, announcement bar, footer, social links, copyright  | Supported |
| Git repo integration, code actions, tags, revisioning, 404 pages            | Supported |
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

Third-party MkDocs plugins are **not loaded directly**. Instead, Zensical replaces the most common ones with built-in functionality:

| Plugin                        | Zensical Status                                                 |
|-------------------------------|-----------------------------------------------------------------|
| `mkdocstrings`                | Replaced by dedicated API documentation module (in development) |
| `git-revision-date-localized` | Native built-in                                                 |
| `git-authors`                 | Native built-in                                                 |
| `git-committers`              | Native built-in                                                 |
| `macros`                      | Replaced by built-in component system                           |
| `minify`                      | Native minification + image compression                         |
| `mike`                        | Native versioning with improved workflows                       |
| `awesome-nav`                 | Native modular navigation                                       |
| `literate-nav`                | Native modular navigation                                       |
| `static-i18n`                 | Native internationalization                                     |
| `blog` / `material/blog`      | Native built-in (port of the Material blog plugin)              |
| `rss`                         | Native built-in ("Zensical RSS" feeds)                          |
| `awesome-pages`               | Not supported: no effect, removed from the mkdox2 templates     |

Other plugins not listed above are **not loaded**: installing their pip package (as `docker/Dockerfile` does) has no effect.
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
