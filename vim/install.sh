#!/bin/sh

DIR="$(pwd -P $0)/vim"

echo "📝 Ensuring vim is setup."

if [ $(uname) = "Darwin" ]; then
  if [ ! -d ~/.vim ]; then
    ln -s $DIR ~/.vim
  fi

  if command -v mvim &> /dev/null; then
    mvim +PlugInstall +qall
  fi
else
  if [ ! -d ~/.vim ]; then
    ln -sd $DIR ~/.vim
  fi

  if command -v vim &> /dev/null; then
    vim +PlugInstall +qall
  fi
fi
