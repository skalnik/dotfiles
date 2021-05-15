#!/bin/sh

DIR="$(pwd -P $0)/vim"

echo "📝 Ensuring vim is setup."

if [ ! -d ~/.vim ]; then
  if [ $(uname) = "Darwin" ]; then
    ln -s $DIR ~/.vim

    if command -v mvim &> /dev/null; then
      mvim +PlugInstall +qall
    fi
  else
    ln -sd $DIR ~/.vim

    if command -v vim &> /dev/null; then
      vim +PlugInstall +qall
    fi
  fi
fi
