#!/usr/bin/env bash

set -euo pipefail

ROOT=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

bash "$ROOT/starship/setup.sh"
bash "$ROOT/tmux-setup/install.sh" --yes --no-update-check "$@"
