# Infrastructure

Changes must be reproducible, idempotent where applicable and documented.
Pin deployed image/tool versions; explain upgrades. Store configuration in Git
and secrets outside Git. Separate example values from actual host configuration.

Before deployment, document target hosts, prerequisites, access, persistence,
backup, validation and rollback. Request deployment authorization if the user
only requested repository work. Never run destructive restore, firewall changes,
`terraform apply`, `ansible-playbook` against hosts or `docker compose up` as lint.

Add service-specific lint and security checks with the first implementation of
Ansible, Compose, Dockerfiles or Terraform. Do not validate empty placeholders as
proof that a service works. A single host does not provide high availability.
