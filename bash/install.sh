#!/bin/sh

DIR="$(pwd -P $0)"

echo "🐣 Ensuring bash is setup."

if [ ! -d ~/.bash ]; then
  if [ $(uname) = "Darwin" ]; then
    ln -s $DIR ~/.bash
  else
    ln -sd $DIR ~/.bash
  fi
fi
