#!/bin/sh
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "📝 Ensuring vim is setup."

if [ ! -d ~/.vim ]; then
  ln -s ~/.dotfiles/vim ~/.vim
fi

if command -v mvim &> /dev/null; then
  mvim -u ~/.vim/plug.vim +PlugInstall +qall
fi
