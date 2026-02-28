FROM zensical/zensical:latest

## install third-party plugins not built into Zensical
RUN pip install --no-cache-dir \
	mkdocs-autolinks-plugin \
	mkdocs-awesome-pages-plugin \
	mkdocs-include-markdown-plugin \
	mkdocs-rss-plugin \
	markdown-include

WORKDIR /docs
EXPOSE 8000

ENTRYPOINT ["/sbin/tini", "--", "zensical"]
CMD ["serve", "--dev-addr=0.0.0.0:8000"]
