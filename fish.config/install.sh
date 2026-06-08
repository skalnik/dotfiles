#!/bin/sh

set -eu

# shellcheck disable=SC1007  # CDPATH= is an environment prefix for cd. It is not an assignment.
DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)

# install.sh links ~/.config/fish already. Only Codespaces needs more, because
# it starts with its own fish configuration and a different login shell.
if [ -z "${CODESPACES:-}" ]; then
  exit 0
fi

echo "🐟 Replacing the Codespaces fish configuration."
rm -rf ~/.config/fish
ln -s "$DIR" ~/.config/fish

fish_path=$(command -v fish || true)

if [ -z "$fish_path" ]; then
  echo "⚠️  fish is not installed. The login shell does not change." >&2
  exit 0
fi

# chsh refuses a shell that /etc/shells does not list.
if ! grep -qx "$fish_path" /etc/shells; then
  echo "$fish_path" | sudo tee -a /etc/shells > /dev/null
fi

sudo chsh "$(id -un)" --shell "$fish_path"
