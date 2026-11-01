# Gotchas

One line each, newest last. Start a line with `path/to/file:` and the session-start hook shows it when that file is in your diff.

- 2026-11-01 docker/push_docker.sh: multi-arch buildx needs a docker-container builder; the default docker driver refuses even with --push (no containerd image store here)
- 2026-11-01 mkdox2.sh: `docker run --platform linux/amd64 <image>` re-tags the local :latest to amd64; on arm64 later runs warn and run emulated until `docker pull --platform linux/arm64 pforret/mkdox-zensical`
- 2026-11-01 docker/Dockerfile: zensical/zensical is Alpine-based since 0.0.33; use apk, not apt-get, for extra system packages
- 2026-11-01 tests/test_basic.sh: piping answers through `script -q /dev/null` loses them (read sees an empty line); drive interactive prompts that need a TTY with `expect`
- 2026-11-01 docker/Dockerfile: Zensical does not load third-party MkDocs plugins; pip-installing them in the image has no effect (blog and rss are native)
- 2026-11-01 mkdox2.sh: `build -I` (~line 216-220) runs `mkdox -R -Q toc` / `mkdox -R -T toc`, the old MkDocs-based tool, not mkdox2
- 2026-11-01 docs/zensical/compatibility.md: git-revision-date-localized, git-authors, git-committers are listed as 'Native built-in' but Zensical's plugin page says Planned
- 2026-11-01 templates/with_blog/docs/blog/.authors.yml: avatar https://github.com/{USERNAME}.png assumes the local whoami equals the GitHub username
- 2026-11-01 mkdox2.sh: `serve` writes draft posts into site/, but `build` empties site/ first, so drafts don't leak into a build
- 2026-11-01 templates/ai_employee/docs/templates/: Zensical does not build a docs folder named templates/; its pages are missing from site/ ('page does not exist' warnings)
- 2026-11-01 templates/*/zensical.toml: privacy without assets_include self-hosts the whole theme bundle (Pyodide, Ace, ad/video SDKs, ~7.7 MB per site)
- 2026-11-01 templates/*/zensical.toml: minify makes index.html one line with unquoted attributes; count matches with grep -o | wc -l, not grep -c
- 2026-11-01 templates/*/zensical.toml: mermaid (superfences) still loads from unpkg; add 'unpkg.com/mermaid@*' to privacy assets_include to self-host it
- 2026-11-01 mkdox2.sh: refuses to run as root ('CANNOT be root'); `act` runs workflow steps as root, so local act runs of bash_unit.yml fail while GitHub's non-root runner passes. Test with a non-root user in catthehacker/ubuntu:act-latest instead
- 2026-11-01 .github/workflows/shellcheck.yml: catthehacker/ubuntu:act-latest has no shellcheck (GitHub's ubuntu-latest does); the workflow installs it when missing
