#!/usr/bin/env bash

set -euo pipefail

ROOT=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

[[ -f "$ROOT/install.sh" ]] || { printf 'FAIL: missing installer\n' >&2; exit 1; }

[[ ! -d "$ROOT/starship" ]] || { printf 'FAIL: settings must not vendor starship\n' >&2; exit 1; }
[[ ! -d "$ROOT/tmux-setup" ]] || { printf 'FAIL: settings must not vendor tmux-setup\n' >&2; exit 1; }

bash -n "$ROOT/install.sh"
grep -F 'https://raw.githubusercontent.com/Ba-koD/starship/main/setup.sh' "$ROOT/install.sh" >/dev/null
grep -F 'https://raw.githubusercontent.com/Ba-koD/tmux-setup/main/install.sh' "$ROOT/install.sh" >/dev/null
grep -F 'curl -fsSL https://raw.githubusercontent.com/Ba-koD/settings/main/install.sh | bash' "$ROOT/README.md" >/dev/null

printf 'PASS: combined installer includes Starship and tmux setup\n'
