# Git workflow

Use GitHub Flow: `main` plus short-lived branches; no permanent development branch.
Start from an up-to-date `main` after checking for local changes.

Branch prefixes: `feat/`, `fix/`, `docs/`, `refactor/`, `ci/`, `chore/`.
Use lowercase kebab-case, such as `feat/prometheus-monitoring`.

Push the branch and open a PR targeting `main`. Keep logical commits reviewable.
Never force-push a shared branch, rewrite published history or bypass required checks
without explicit authorization. Do not merge or deploy merely because CI passes.

After merging, delete the feature branch and update local `main` with `--ff-only`.
Repository owners should protect `main` against direct pushes and force pushes and
require the `Repository validation` and `PR title` checks after they first run.
Keep merge commits or rebase merging available when preserving separate commits.
