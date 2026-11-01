#!/usr/bin/env bash
# Validate tracked source files without applying infrastructure changes.
set -euo pipefail
cd "$(git -C "$(dirname "${BASH_SOURCE[0]}")" rev-parse --show-toplevel)"

for tool in yamllint shellcheck actionlint markdownlint-cli2; do
  if ! command -v "$tool" >/dev/null 2>&1; then
    printf 'Missing required tool: %s (see CONTRIBUTING.md)\n' "$tool" >&2
    exit 1
  fi
done

yaml_files=()
shell_files=()
markdown_files=()
while IFS= read -r -d '' file; do
  [[ -s "$file" ]] || continue
  case "$file" in
    *.yml|*.yaml) yaml_files+=("$file") ;;
    *.sh) shell_files+=("$file") ;;
    *.md) markdown_files+=("$file") ;;
  esac
done < <(git ls-files -z)

if ((${#yaml_files[@]})); then yamllint --strict "${yaml_files[@]}"; fi
if ((${#shell_files[@]})); then shellcheck --external-sources "${shell_files[@]}"; fi
actionlint
if ((${#markdown_files[@]})); then markdownlint-cli2 "${markdown_files[@]}"; fi
printf '%s\n' 'Repository validation passed. Run gitleaks git --redact separately.'
