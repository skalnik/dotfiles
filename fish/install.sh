#!/bin/sh
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "🐟 Ensuring fish is setup."
if [ ! -d ~/.config/fish ]; then
  if [ ! -d ~/.config ]; then
    mkdir ~/.config
  fi

  ln -s $DIR ~/.config/fish
fi
