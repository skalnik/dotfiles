#!/bin/sh

DIR=$(pwd -P "$0")/halloy

echo "💬 Ensuring halloy is setup."
if [ ! -d ~/.config/halloy ]; then
  if [ ! -d ~/.config ]; then
    mkdir ~/.config
  fi

  ln -s "$DIR" ~/.config/halloy
fi
