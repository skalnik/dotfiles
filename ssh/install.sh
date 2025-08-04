#!/bin/sh

echo "🔐 Setting up SSH."

DIR=$(pwd -P "$0")/ssh

if [ -n "$CODESPACES" ]; then
  echo "🔐 Already setup on Codespaces!"
  exit 0
fi

if ! test -d ~/.ssh; then
  ln -s "$DIR" ~/.ssh
fi

op_get Private/2i3kib6vtrae3jm3skpbv4xc5u .ssh/id_ecdsa
op_get Private/kbqovo5pojhpvfljo27fpgor7y .ssh/id_rsa

echo "🔐 Storing SSH keys in keychain..."
ssh-add --apple-use-keychain
