#!/bin/sh

DIR=$(pwd -P "$0")/fish

echo "🐟 Ensuring fish is setup."
if [ ! -d ~/.config/fish ]; then
  if [ ! -d ~/.config ]; then
    mkdir ~/.config
  fi

  ln -s "$DIR" ~/.config/fish
fi

if [ -n "$CODESPACES" ]; then
  # Remove the existing fish config
  rm -rf ~/.config/fish
  ln -s "$DIR" ~/.config/fish
  sudo chsh "$(id -un)" --shell "/usr/bin/fish"
fi
