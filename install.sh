#!/usr/bin/env bash

set -euo pipefail

curl -fsSL https://raw.githubusercontent.com/Ba-koD/starship/main/setup.sh | bash
curl -fsSL https://raw.githubusercontent.com/Ba-koD/tmux-setup/main/install.sh | bash -s -- --yes --no-update-check "$@"
