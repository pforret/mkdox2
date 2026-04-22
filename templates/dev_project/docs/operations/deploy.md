# Deploy

How code reaches production.

## Pipeline

```
PR → CI (lint + tests) → merge to main → deploy job → health check → done
```

## Environments

| Env | URL | Branch | Auto-deploy |
| --- | --- | --- | --- |
| local | http://localhost:8000 | any | n/a |
| staging | https://staging.{SITE_URL} | `main` | yes |
| production | https://{SITE_URL} | tag `vX.Y.Z` | on tag |

## Cutting a release

1. Confirm `main` is green.
2. Update [Changelog](../changelog.md): rename `[Unreleased]` to the new version.
3. Tag: `git tag vX.Y.Z && git push --tags`.
4. Deploy job runs, posts status to Slack.
5. Verify health endpoint and key flows.
6. Watch [Observability](observability.md) for the next 30 min.

## Rollback

```bash
# replace with your hosting provider's command
fly deploy --image registry.fly.io/{SITE_NAME}:<previous-sha> -a {SITE_NAME}
```

If rollback is needed, open an [incident](incidents.md) entry.

## Secrets

- Never commit secrets.
- Set them via `fly secrets set KEY=value` (or your provider's equivalent).
- Document the variable in [Environment](../getting-started/environment.md).
