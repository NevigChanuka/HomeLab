# Contributing to HomeLab

Use short-lived branches from `main` and open PRs. See
[agent rules](.agents/README.md) for the same workflow used by automated assistants.
Use Conventional Commits and PR titles under 72 characters. Aim for 1–5 related
files per commit and omit co-author trailers. Do not commit secrets or runtime data.

## Local validation

Install these tools, using their official releases:

| Tool | Version used in CI |
| --- | --- |
| Python | 3.12 |
| yamllint | 1.35.1 |
| ShellCheck | 0.10.0 |
| actionlint | 1.7.7 |
| Node.js | 22 |
| markdownlint-cli2 | 0.18.1 |
| Gitleaks | 8.24.2 |

```bash
python3 -m venv .venv
.venv/bin/pip install yamllint==1.35.1
# Install ShellCheck, actionlint and Gitleaks from their official releases.
# Install markdownlint-cli2 in a tool directory outside the repository.
PATH="$(pwd)/.venv/bin:$PATH" bash scripts/validate.sh
gitleaks git --redact
```

The validator checks tracked, non-empty YAML, shell and Markdown files and all
Actions workflows. Run it from any directory. Stage new files before validating
so they are included. Missing tools or findings produce a nonzero exit status.
Gitleaks scans full Git history separately, with redacted findings.
CI runs the same validator on every push to `main`, PR and manual dispatch.
Deployment remains disabled.

## Enabling subsystem checks

Current Compose, Ansible and Dockerfile content is scaffold only. Add the deeper
checks in [testing rules](.agents/rules/testing.md) in the same PR that implements
each subsystem. Supply sanitized fixture values when configuration needs an
environment; never use live server credentials. Do not suppress a failing real
configuration by labeling it a placeholder.

## Pull requests

Use the PR template and include the outcome, validation and rollback. Inspect CI
before requesting review. Repository settings are managed by the owner: once the
checks exist, protect `main` and require `Repository validation` and `PR title`.
No branch protection or deployment settings are changed by this harness.
