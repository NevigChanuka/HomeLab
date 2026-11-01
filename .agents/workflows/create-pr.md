# Create a PR

1. Check the branch, working tree and complete diff against `main`.
2. Run repository and subsystem checks; scan for secrets.
3. Stage explicit paths and create short Conventional Commits, normally 1–5 files.
4. Push the branch and use `.github/pull_request_template.md` for the PR body.
5. State the result, validation evidence, skipped checks, operational impact and rollback.
6. Inspect GitHub checks and resolve failures. Leave merging to the owner unless requested.

Use a Conventional Commit PR title under 72 characters. Never add co-author trailers.
