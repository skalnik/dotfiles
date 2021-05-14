#!/bin/sh

DIR="$(pwd -P $0)"

echo "🐟 Ensuring fish is setup."
if [ ! -d ~/.config/fish ]; then
  if [ ! -d ~/.config ]; then
    mkdir ~/.config
  fi

  ln -s $DIR ~/.config/fish
fi
