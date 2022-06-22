#!/bin/sh

DIR=$(pwd -P "$0")
OS=$(uname)

if [ "$OS" = "Darwin" ] && ! command -v brew > /dev/null; then
  echo '🍺 Installing Homebrew.'
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

if [ "$OS" = "Darwin" ]; then
  brew="(which brew)"
fi

if [ -n "$CODESPACES" ]; then
  brew=/home/linuxbrew/.linuxbrew/bin/brew
fi

echo '📦 Checking if we need to install packages…'
if ! $brew bundle check; then
  # shellcheck disable=SC2016
  echo '📦 Running `brew bundle install` to install desired packages.'
  $brew bundle install
fi

# Link all linkable files
for linkable in "$DIR"/**/*.symlink; do
  target=$HOME"/."$(basename "$linkable" | sed 's/.symlink//')
  if [ ! -L "$target" ]; then
    echo "🔗 Linking $target → $linkable."
    ln -Ff -s "$linkable" "$target"
  fi
done

for executable in "$DIR"/**/install.sh; do
  echo "👟 Running $executable."
  sh "$executable"
done

