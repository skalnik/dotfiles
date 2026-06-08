#!/bin/sh

set -eu

# shellcheck disable=SC1007  # CDPATH= is an environment prefix for cd. It is not an assignment.
DOTFILES=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)
export DOTFILES

cd "$DOTFILES"

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

    brew bundle install || echo '⚠️  Some packages failed to install.'
  fi
fi

# Symlink $src to $target, or alert
link() {
  src=$1
  target=$2

  if [ -L "$target" ]; then
    current=$(readlink "$target")

    if [ "$current" = "$src" ]; then
      return 0
    fi

    # Repair a broken link that points into this repository.
    case $current in
      "$DOTFILES"/*)
        if [ ! -e "$target" ]; then
          echo "🔗 Relinking $target → $src."
          rm "$target"
          ln -s "$src" "$target"
          return 0
        fi
        ;;
    esac

    echo "⚠️  $target already links elsewhere, leaving it alone."
    return 0
  fi

  if [ -e "$target" ]; then
    echo "⚠️  $target already exists and isn't a symlink, leaving it alone."
    return 0
  fi

  echo "🔗 Linking $target → $src."
  ln -s "$src" "$target"
}

for linkable in "$DOTFILES"/*/*.symlink; do
  [ -e "$linkable" ] || continue
  link "$linkable" "$HOME/.$(basename "$linkable" .symlink)"
done

mkdir -p "$HOME/.config"
for topic in "$DOTFILES"/*.config; do
  [ -d "$topic" ] || continue
  link "$topic" "$HOME/.config/$(basename "$topic" .config)"
done

# Topics that do more than a symlink
for installer in "$DOTFILES"/*/install.sh; do
  [ -e "$installer" ] || continue
  echo "👟 Running $installer."
  sh "$installer" || echo "⚠️  $installer failed."
done
