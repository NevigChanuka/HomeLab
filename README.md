# HomeLab — HomeOps Platform

Ubuntu infrastructure and SRE lab. Status: initial scaffold only; no services deployed.

## Structure

- architecture/: diagrams, network topology, service inventory
- ansible/: inventory example, playbooks and roles
- docker/: application and monitoring Compose placeholders
- monitoring/: Prometheus, Grafana, Alloy, Loki and Alertmanager
- app/: sample application source and tests
- scripts/: backup, restore and health checks
- tests/: load tests and failure scenarios
- docs/: runbooks, incidents, security, recovery and reliability evidence
- .github/workflows/: PR checks and a disabled deployment scaffold

## Next steps

1. Inventory the Ubuntu host and existing Nginx, Cockpit, Samba, SSH and Tailscale services.
2. Document topology and access policies.
3. Copy ansible/inventory.example.ini to ignored inventory.ini and replace example values.
4. Implement host monitoring, dashboards and alerts.
5. Configure off-host backups and test a restore.
6. Implement automation and deployment after manual validation.

Configuration files are placeholders. Validate and complete them before use.
Do not commit credentials, private inventories or runtime data. A single host does not provide high availability.

## Engineering workflow

Read [CONTRIBUTING.md](CONTRIBUTING.md) for branches, focused commits, local checks
and PR requirements. AI assistants start with [AGENTS.md](AGENTS.md); shared guides
live in [.agents/](.agents/README.md). See [SECURITY.md](SECURITY.md) for private reporting.

CI validates YAML, shell scripts, GitHub Actions, Markdown and Git history for
secrets. Deeper subsystem validation is added as placeholders become functional.
