#!/bin/sh
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "🔐 Setting up SSH."

if ! test -d ~/.ssh; then
  ln -s $(pwd) ~/.ssh
fi

if ! test -f ~/.ssh/id_ecdsa; then
  op_get 2i3kib6vtrae3jm3skpbv4xc5u .ssh/id_ecdsa
fi

if ! test -f ~/.ssh/id_rsa; then
  op_get kbqovo5pojhpvfljo27fpgor7y .ssh/id_rsa
fi

echo "🔐 Storing SSH keys in keychain..."
ssh-add -K
