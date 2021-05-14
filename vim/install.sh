#!/bin/sh

DIR="$(pwd -P $0)"

echo "📝 Ensuring vim is setup."

if [ ! -d ~/.vim ]; then
  ln -s ~/.dotfiles/vim ~/.vim
fi

if command -v mvim &> /dev/null; then
  mvim +PlugInstall +qall
fi
