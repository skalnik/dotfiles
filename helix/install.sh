#!/bin/sh

DIR=$(pwd -P "$0")/helix

echo "📝 Ensuring helix is setup."
if [ ! -d ~/.config/helix ]; then
  if [ ! -d ~/.config ]; then
    mkdir ~/.config
  fi

  ln -s "$DIR" ~/.config/helix
fi
