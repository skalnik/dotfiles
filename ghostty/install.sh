#!/bin/sh

DIR=$(pwd -P "$0")/ghostty

echo "👻 Ensuring ghostty is setup."
if [ ! -d ~/.config/ghostty ]; then
  if [ ! -d ~/.config ]; then
    mkdir ~/.config
  fi

  ln -s "$DIR" ~/.config/ghostty
fi
