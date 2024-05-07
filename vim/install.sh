#!/bin/sh

DIR=$(pwd -P "$0")/vim

echo "📝 Ensuring vim is setup."

if [ -n "$CODESPACES" ]; then
  echo "⛷️ Skipping vim setup on Codespaces."
  exit 0
fi

if [ "$(uname)" = "Darwin" ]; then
  if [ ! -d ~/.vim ]; then
    ln -s "$DIR" ~/.vim
  fi
else
  if [ ! -d ~/.vim ]; then
    ln -sd "$DIR" ~/.vim
  fi
fi

if command -v vim > /dev/null; then
  vim -u ~/.vim/install.vim
fi
