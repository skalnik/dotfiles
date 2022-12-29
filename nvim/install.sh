#!/bin/sh

DIR=$(pwd -P "$0")/nvim

echo "📝 Ensuring neovim is setup."

if [ ! -d ~/.config/nvim ]; then
  ln -s "$DIR" ~/.config/nvim
fi
