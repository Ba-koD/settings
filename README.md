# settings

Combined Starship and tmux setup for macOS and Linux.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/Ba-koD/settings/main/install.sh | bash
```

The wrapper downloads and runs the existing upstream installers; it does not copy their source code into this repository.

1. Starship installer runs first. It installs Starship and its supporting terminal tools, then configures the current login shell without deleting or replacing an existing shell configuration file.
2. tmux installer runs second with `--yes --no-update-check`. It installs or updates tmux and adds only its managed blocks to `~/.tmux.conf`, `~/.zshrc`, and `~/.bashrc`.

Both installers can install missing packages and may request system-package permissions when required by the operating system.
