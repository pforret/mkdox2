# Zensical MiniJinja Template Reference

Zensical uses [MiniJinja](https://docs.rs/minijinja/latest/minijinja/) instead of Python's Jinja2.
No Python interpreter is available — only the built-in filters and tests below.

## Filters

| Filter       | Description                                    |
|--------------|------------------------------------------------|
| `abs`        | Absolute value of a number                     |
| `attr`       | Look up an attribute by name                   |
| `batch`      | Batch items into fixed-size groups             |
| `bool`       | Convert to boolean                             |
| `capitalize` | Uppercase first char, lowercase rest           |
| `chain`      | Chain multiple iterables into one              |
| `default`    | Fallback value if undefined                    |
| `dictsort`   | Sort a dictionary                              |
| `escape`     | HTML-escape a string                           |
| `first`      | First item of an iterable                      |
| `float`      | Convert to float                               |
| `format`     | Printf-style string formatting                 |
| `groupby`    | Group sequence of objects by attribute         |
| `indent`     | Indent text with spaces                        |
| `int`        | Convert to integer                             |
| `items`      | Return key-value pairs from a mapping          |
| `join`       | Join sequence with separator                   |
| `last`       | Last item of an iterable                       |
| `length`     | Length of a value                              |
| `lines`      | Split string into lines                        |
| `list`       | Convert to list                                |
| `lower`      | Lowercase a string                             |
| `map`        | Apply filter or look up attribute on sequence  |
| `max`        | Largest item from iterable                     |
| `min`        | Smallest item from iterable                    |
| `pprint`     | Pretty-print a variable                        |
| `reject`     | Filter out items that pass a test              |
| `rejectattr` | Filter out items where attribute passes a test |
| `replace`    | String replace                                 |
| `reverse`    | Reverse iterable or string                     |
| `round`      | Round number to precision                      |
| `safe`       | Mark string as safe (no escaping)              |
| `select`     | Keep items that pass a test                    |
| `selectattr` | Keep items where attribute passes a test       |
| `slice`      | Slice iterable into chunks                     |
| `sort`       | Sort a list                                    |
| `split`      | Split string by separator                      |
| `string`     | Convert to string                              |
| `sum`        | Sum all values                                 |
| `title`      | Title Case                                     |
| `tojson`     | Dump to JSON                                   |
| `trim`       | Strip whitespace                               |
| `unique`     | Unique items from iterable                     |
| `upper`      | Uppercase a string                             |
| `urlencode`  | URL-encode a value                             |
| `zip`        | Zip iterables into tuples                      |

## Tests

Used with `is` keyword, e.g. `{% if value is defined %}`.

| Test           | Description                  |
|----------------|------------------------------|
| `boolean`      | Is a boolean                 |
| `defined`      | Has a value                  |
| `divisibleby`  | Divisible by N               |
| `endingwith`   | String ends with substring   |
| `eq`           | Equal to                     |
| `even`         | Even number                  |
| `false`        | Is false                     |
| `filter`       | Filter name exists           |
| `float`        | Is a float                   |
| `ge` / `gt`    | Greater than (or equal)      |
| `in`           | Member of collection         |
| `integer`      | Is an integer                |
| `iterable`     | Can be iterated              |
| `le` / `lt`    | Less than (or equal)         |
| `lower`        | All lowercase                |
| `mapping`      | Is a dict/mapping            |
| `ne`           | Not equal                    |
| `none`         | Is null/undefined            |
| `number`       | Is numeric                   |
| `odd`          | Odd number                   |
| `safe`         | Marked as safe               |
| `sameas`       | Identical reference          |
| `sequence`     | Is an ordered collection     |
| `startingwith` | String starts with substring |
| `string`       | Is a string                  |
| `test`         | Test name exists             |
| `true`         | Is true                      |
| `undefined`    | Has no value                 |
| `upper`        | All uppercase                |

## Blog Index via MiniJinja — Feasibility

**Question:** Can MiniJinja template overrides generate a `docs/blog/index.md` listing from posts in `docs/blog/posts/`?

**Answer: No.** MiniJinja cannot:

- **Read the filesystem** — no way to scan a directory for `.md` files
- **Parse front matter** — no YAML/string parsing beyond basic filters
- **Access other pages' content** — the template context only has the current `page`, `nav`, and `config`

The `nav` object could theoretically be walked to find blog pages, but it lacks access to post metadata (date, excerpt, thumbnail) and there's no way to sort by date or extract content.

### Workarounds

| Approach                   | How                                                                                                               |
|----------------------------|-------------------------------------------------------------------------------------------------------------------|
| **Python hook** (current)  | `hooks/blog_context.py` with `on_page_markdown` — scans posts, injects listing into `blog/index.md` at build time |
| **Build script**           | Pre-generate `blog/index.md` as a build step before `mkdox build`                                                 |
| **Wait for Zensical blog** | Zensical lists blog as a supported feature; native blog support may arrive soon                                   |

The Python hook approach is the most practical solution until Zensical ships native blog support.
