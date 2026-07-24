#!/usr/bin/env bash

set -euo pipefail

ROOT=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

for path in "$ROOT/install.sh" "$ROOT/starship/setup.sh" "$ROOT/tmux-setup/install.sh"; do
  [[ -f "$path" ]] || { printf 'FAIL: missing %s\n' "$path" >&2; exit 1; }
done

bash -n "$ROOT/install.sh"
grep -F 'starship/setup.sh' "$ROOT/install.sh" >/dev/null
grep -F 'tmux-setup/install.sh' "$ROOT/install.sh" >/dev/null
grep -F -- '--yes --no-update-check' "$ROOT/install.sh" >/dev/null
grep -F 'curl -fsSL https://raw.githubusercontent.com/Ba-koD/settings/main/install.sh | bash' "$ROOT/README.md" >/dev/null

printf 'PASS: combined installer includes Starship and tmux setup\n'
