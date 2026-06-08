#!/bin/sh

set -eu

# shellcheck disable=SC1007  # CDPATH= is an environment prefix for cd. It is not an assignment.
DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)

TARGET=$HOME/.ssh

echo "🔐 Setting up SSH."


mkdir -p "$TARGET"
chmod 700 "$TARGET"

for tracked in "$DIR"/config "$DIR"/*.pub; do
  [ -e "$tracked" ] || continue

  name=$(basename "$tracked")

  if [ ! -e "$TARGET/$name" ]; then
    echo "🔗 Linking ~/.ssh/$name → $DIR/$name."
    ln -s "$tracked" "$TARGET/$name"
  fi
done

mkdir -p "$TARGET"/config.d
chmod 700 "$TARGET"/config.d

if [ ! -e "$TARGET"/config.local ]; then
  echo "📝 Making ~/.ssh/config.local for the machine specific hosts."
  (umask 077 && touch "$TARGET"/config.local)
fi

# op_get makes the path relative to $HOME. It also sets mode 600 on the file.
if [ ! -f "$TARGET"/id_ecdsa ]; then
  op_get Private/2i3kib6vtrae3jm3skpbv4xc5u .ssh/id_ecdsa
fi

if [ ! -f "$TARGET"/id_rsa ]; then
  op_get Private/kbqovo5pojhpvfljo27fpgor7y .ssh/id_rsa
fi

if [ "$(uname)" = "Darwin" ]; then
  echo "🔐 Storing SSH keys in the keychain."
  ssh-add --apple-use-keychain
fi
