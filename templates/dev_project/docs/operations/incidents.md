# Incidents

What to do when production is broken.

## During the incident

1. **Acknowledge** the alert in the on-call channel.
2. **Open** an incident channel: `#inc-YYYY-MM-DD-<slug>`.
3. **Assign** roles: incident commander, comms, scribe.
4. **Mitigate first, root-cause later** — rollback ([Deploy](deploy.md)) is often the fastest path.
5. **Communicate** status updates every 15–30 minutes.

## Severity

| Sev | Definition | Response time |
| --- | --- | --- |
| 1 | Full outage | immediate, all hands |
| 2 | Major feature broken | < 30 min |
| 3 | Degraded for some users | < 4 h, business hours |

## After the incident

1. Resolve and downgrade.
2. Schedule a blameless post-mortem within a week.
3. File action items as PRs or issues.
4. If the cause exposes an architectural gap, write an [ADR](../architecture/decisions/index.md).
5. Update the [Runbook](runbook.md) with the new recipe.

## Reference

- On-call rota: _link_
- Status page: _link_
- Escalation: _link_
