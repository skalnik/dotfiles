#!/bin/sh

DIR=$(pwd -P "$0")
OS=$(uname)

if [ "$OS" = "Darwin" ]; then
  if ! command -v brew > /dev/null; then
    echo '🍺 Installing Homebrew.'
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  fi

  echo '📦 Checking if we need to install packages…'
  if ! brew bundle check; then
    # shellcheck disable=SC2016
    echo '📦 Running `brew bundle install` to install desired packages.'
    brew bundle install
  fi
fi

if [ -n "$CODESPACES" ]; then
  echo 'No packages to install in Codespaces!'
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

