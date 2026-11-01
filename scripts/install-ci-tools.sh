#!/usr/bin/env bash
# Install Linux x86_64 CI tools; verify archives before extracting binaries.
set -euo pipefail
: "${RUNNER_TEMP:?Run this installer in GitHub Actions}"
: "${GITHUB_PATH:?GitHub Actions PATH file is required}"
tool_dir="$RUNNER_TEMP/homeops-tools"
mkdir -p "$tool_dir"
cd "$tool_dir"

curl -fsSLO https://github.com/rhysd/actionlint/releases/download/v1.7.7/actionlint_1.7.7_linux_amd64.tar.gz
curl -fsSLO https://github.com/rhysd/actionlint/releases/download/v1.7.7/actionlint_1.7.7_checksums.txt
awk '$2 == "actionlint_1.7.7_linux_amd64.tar.gz"' actionlint_1.7.7_checksums.txt > actionlint.sha256
[[ -s actionlint.sha256 ]]
sha256sum -c actionlint.sha256
tar -xzf actionlint_1.7.7_linux_amd64.tar.gz actionlint

curl -fsSLO https://github.com/gitleaks/gitleaks/releases/download/v8.24.2/gitleaks_8.24.2_linux_x64.tar.gz
curl -fsSLO https://github.com/gitleaks/gitleaks/releases/download/v8.24.2/gitleaks_8.24.2_checksums.txt
awk '$2 == "gitleaks_8.24.2_linux_x64.tar.gz"' gitleaks_8.24.2_checksums.txt > gitleaks.sha256
[[ -s gitleaks.sha256 ]]
sha256sum -c gitleaks.sha256
tar -xzf gitleaks_8.24.2_linux_x64.tar.gz gitleaks

curl -fsSLO https://github.com/koalaman/shellcheck/releases/download/v0.10.0/shellcheck-v0.10.0.linux.x86_64.tar.xz
printf '%s  %s\n' \
  '6c881ab0698e4e6ea235245f22832860544f17ba386442fe7e9d629f8cbedf87' \
  'shellcheck-v0.10.0.linux.x86_64.tar.xz' > shellcheck.sha256
sha256sum -c shellcheck.sha256
tar -xJf shellcheck-v0.10.0.linux.x86_64.tar.xz --strip-components=1 shellcheck-v0.10.0/shellcheck
printf '%s\n' "$tool_dir" >> "$GITHUB_PATH"
