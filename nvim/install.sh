#!/bin/sh

DIR=$(pwd -P "$0")/nvim

echo "📝 Ensuring neovim is setup."

if [ ! -d ~/.config/nvim ]; then
  ln -s "$DIR" ~/.config/nvim
fi

if command -v nvim > /dev/null; then
  nvim -u ~/.config/nvim/install.vim
else
  echo "🤷 Ain't no neovim to setup!"
fi
