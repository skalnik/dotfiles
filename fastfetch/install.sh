#!/bin/sh

DIR=$(pwd -P "$0")/fastfetch

echo "🦴 Ensuring fastfetch is setup."
if [ ! -d ~/.config/fastfetch ]; then
  if [ ! -d ~/.config ]; then
    mkdir ~/.config
  fi

  ln -s "$DIR" ~/.config/fastfetch
fi
