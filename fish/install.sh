#!/bin/sh
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ ! -d ~/.config/fish ]
then
  if [ ! -d ~/.config ]
  then
    mkdir ~/.config
  fi

  ln -s $DIR ~/.config/fish
fi

grep $(brew --prefix)/bin/fish /etc/shells || echo "$(brew --prefix)/bin/fish" | sudo tee -a /etc/shells
