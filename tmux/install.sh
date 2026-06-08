#!/bin/sh

set -eu

# shellcheck disable=SC1007  # CDPATH= is an environment prefix for cd. It is not an assignment.
DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)

echo "🐚 Ensuring tmux is setup."
if [ ! -e ~/.tmux ]; then
  ln -s "$DIR" ~/.tmux
fi

if [ ! -e ~/.tmux.conf ]; then
  ln -s "$DIR"/tmux.conf "$HOME"/.tmux.conf
fi
