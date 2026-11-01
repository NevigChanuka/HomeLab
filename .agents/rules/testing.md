# Testing

Run `bash scripts/validate.sh` for YAML, shell, Actions and Markdown checks.
Run `gitleaks git --redact` separately for history secret detection, as CI does.
Read `CONTRIBUTING.md` for versions and commands. Missing tools must fail clearly;
skipped checks must never be reported as passing.

When a subsystem becomes real, add its checks in the same PR:

| Files implemented | Required validation |
| --- | --- |
| Ansible roles/playbooks | ansible-lint and syntax check with example inventory |
| Compose services | docker compose config -q using sanitized CI environment |
| Dockerfiles | Hadolint and Trivy image/config scanning as applicable |
| Terraform modules | terraform fmt -check and validate; Checkov or Trivy |
| Prometheus/alerts | promtool check config and check rules |

Do not use production credentials or connect to the live server during CI.
Use meaningful negative tests for validation logic and verify operational behavior
in a disposable environment before claiming deployment success.
