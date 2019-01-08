#!/bin/sh
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "🐟 Ensuring fish is setup."
if [ ! -d ~/.config/fish ]; then
  if [ ! -d ~/.config ]; then
    mkdir ~/.config
  fi

  ln -s $DIR ~/.config/fish
fi


if ! grep $(brew --prefix)/bin/fish /etc/shells > /dev/null; then
  echo "🐟 Adding fish to list of usable shells."
  echo "$(brew --prefix)/bin/fish" | sudo tee -a /etc/shells
fi

if ! dscl . -read /Users/$USER UserShell | grep $(brew --prefix)/bin/fish > /dev/null; then
  echo "🐟 Setting fish as default shell. This may require your password."
  chsh -s $(brew --prefix)/bin/fish
fi
