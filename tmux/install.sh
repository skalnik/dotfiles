#!/bin/sh

DIR="$(pwd -P $0)/tmux"

echo "🐚 Ensuring tmux is setup."
if [ ! -d ~/.tmux ]; then
  ln -s $DIR ~/.tmux
fi

if [ ! -f ~/.tmux.conf ]; then
  ln -sf "$DIR"/tmux.conf "$HOME"/.tmux.conf
fi
