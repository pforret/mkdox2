# Observability

How you know what's happening in production.

## Logs

- **Where:** _e.g. Fly logs / CloudWatch / Loki_
- **Tail:** see [Runbook](runbook.md)
- **Convention:** structured JSON, one event per line

## Metrics

- **Where:** _e.g. Grafana / Prometheus / Datadog_
- **Key dashboards:**
    - Request rate, latency (p50/p95/p99), error rate
    - Background job throughput and failure rate (see [Jobs](../reference/jobs.md))
    - DB query time, connection pool

## Traces

- **Where:** _e.g. Sentry / Honeycomb / OpenTelemetry collector_
- **Sampled at:** 10% in prod, 100% in staging

## Alerts

| Condition | Channel | Severity |
| --- | --- | --- |
| 5xx rate > 1% for 5 min | #oncall | critical |
| p95 latency > 1s for 10 min | #oncall | warning |
| Job failure rate > 5% | #eng-jobs | warning |
| Disk > 85% | #infra | warning |

When an alert fires → [Incidents](incidents.md).
