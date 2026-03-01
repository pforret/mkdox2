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

Plugins not listed above (e.g. `awesome-pages`, `blog`, `rss`) are **not yet supported** in Zensical.
