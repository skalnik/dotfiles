#!/bin/sh

DIR=$(pwd -P "$0")/claude

echo "🤖 Ensuring claude is setup."
if [ ! -d ~/.config/claude ]; then
  ln -s "$DIR" ~/.claude
fi
