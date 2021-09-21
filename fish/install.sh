#!/bin/sh

DIR="$(pwd -P $0)/fish"

echo "🐟 Ensuring fish is setup."
if [ ! -d ~/.config/fish ]; then
  if [ ! -d ~/.config ]; then
    mkdir ~/.config
  fi

  ln -s $DIR ~/.config/fish
fi

if [ -n "$CODESPACES" ]; then
  if ! grep -q "root.*/bin/fish" /etc/passwd
  then
    chsh -s /bin/fish root
  fi
fi
