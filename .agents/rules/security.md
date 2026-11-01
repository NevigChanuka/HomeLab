# Security

Never commit passwords, API tokens, SSH keys, real inventories, private addresses
or customer data. Use sanitized examples and ignored local environment files.
Do not print credentials in logs or paste them into PRs.
If a secret leaks, stop exposing it, notify the owner and rotate it; deletion alone
is insufficient. Follow `SECURITY.md` for reporting.

Use least privilege, read-only CI tokens and pinned action commit hashes.
Never execute untrusted PR content in a privileged `pull_request_target` workflow.
Do not expose Cockpit, Samba or monitoring interfaces publicly without an explicit
access design. Preserve remote access when proposing SSH or firewall changes.
