#!/usr/bin/env bash

set -euo pipefail

github_raw() {
  curl -fsSL -H 'Accept: application/vnd.github.raw+json' "$1"
}

github_raw https://api.github.com/repos/Ba-koD/starship/contents/setup.sh | bash
github_raw https://api.github.com/repos/Ba-koD/tmux-setup/contents/install.sh | bash -s -- --yes --no-update-check "$@"
