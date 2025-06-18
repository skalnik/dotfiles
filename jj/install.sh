#!/bin/sh

DIR=$(pwd -P "$0")/jj

echo "🕊️ Ensuring jj is setup."
if [ ! -d ~/.config/jj ]; then
  if [ ! -d ~/.config ]; then
    mkdir ~/.config
  fi

  ln -s "$DIR" ~/.config/jj
fi
