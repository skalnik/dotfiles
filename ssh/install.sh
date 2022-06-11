#!/bin/sh

echo "🔐 Setting up SSH."

if [ -n "$CODESPACES" ]; then
  echo "🔐 Already setup on Codespaces!"
  exit 0
fi

if ! test -d ~/.ssh; then
  ln -s "$(pwd)" ~/.ssh
fi

op_get 2i3kib6vtrae3jm3skpbv4xc5u .ssh/id_ecdsa
op_get kbqovo5pojhpvfljo27fpgor7y .ssh/id_rsa

echo "🔐 Storing SSH keys in keychain..."
ssh-add -K
