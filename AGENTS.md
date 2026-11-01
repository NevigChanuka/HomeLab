# Agent instructions

Read this file before changing HomeLab. Shared guidance lives in [.agents/README.md](.agents/README.md).

- This repository is an Ubuntu HomeOps/SRE learning lab, currently a scaffold.
  Do not claim services, monitoring or recovery are implemented without evidence.
- Read the relevant rules and workflow under `.agents/` before editing.
- Work on a short-lived branch from `main`; deliver changes through a PR.
- Make focused Conventional Commits, normally changing 1–5 files each.
  Keep subjects under 72 characters; never add co-author trailers.
- Inspect the working tree first. Preserve unrelated changes and never commit secrets.
- Run `bash scripts/validate.sh` and review the staged diff before committing.
  Report skipped checks and missing tools honestly.
- Infrastructure operations require an explicit deployment request: repository edits
  and linting do not authorize restarting services, opening ports or applying changes.
- Document validation, operational impact and rollback for implemented services.
