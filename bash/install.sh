#!/bin/sh

DIR=$(pwd -P "$0")/bash

echo "🐣 Ensuring bash is setup."

if [ ! -d ~/.bash ]; then
  if [ "$(uname)" = "Darwin" ]; then
    ln -s "$DIR" ~/.bash
  else
    ln -sd "$DIR" ~/.bash
  fi
fi
