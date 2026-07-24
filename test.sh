#!/usr/bin/env bash

set -euo pipefail

ROOT=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

[[ -f "$ROOT/install.sh" ]] || { printf 'FAIL: missing installer\n' >&2; exit 1; }

[[ ! -d "$ROOT/starship" ]] || { printf 'FAIL: settings must not vendor starship\n' >&2; exit 1; }
[[ ! -d "$ROOT/tmux-setup" ]] || { printf 'FAIL: settings must not vendor tmux-setup\n' >&2; exit 1; }

bash -n "$ROOT/install.sh"
grep -F 'https://api.github.com/repos/Ba-koD/starship/contents/setup.sh' "$ROOT/install.sh" >/dev/null
grep -F 'https://api.github.com/repos/Ba-koD/tmux-setup/contents/install.sh' "$ROOT/install.sh" >/dev/null
grep -F 'https://api.github.com/repos/Ba-koD/settings/contents/install.sh' "$ROOT/README.md" >/dev/null
grep -F 'Starship installer runs first.' "$ROOT/README.md" >/dev/null
grep -F 'tmux installer runs second with `--yes --no-update-check`.' "$ROOT/README.md" >/dev/null

printf 'PASS: combined installer includes Starship and tmux setup\n'
