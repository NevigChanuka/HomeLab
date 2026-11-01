# Commits

Use `type(scope): imperative summary`; scope is optional.
Types: `feat`, `fix`, `docs`, `refactor`, `test`, `ci`, `chore`, `build`, `perf`, `revert`.

- Target 1–5 changed files per commit and one clear purpose. This is a review
  guideline: keep inseparable changes together and explain larger exceptions.
- Keep the subject under 72 characters. Use a body only when context helps.
- Stage explicit paths; inspect `git diff --cached` and run relevant checks.
- Never include secrets, unrelated changes, generated runtime data or co-author trailers.
- Do not create empty commits or split working code into intentionally broken steps.

Examples: `docs(agents): define contribution rules`,
`ci: validate YAML and shell scripts`, `feat(monitoring): add host metrics`.
