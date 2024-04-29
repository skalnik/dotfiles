#!/bin/sh

DIR=$(pwd -P "$0")/kitty

echo "🐈️ Ensuring kitty is setup."

if [ ! -d ~/.config/kitty ]; then
  ln -s "$DIR" ~/.config/kitty
fi
