#!/bin/sh

DIR=$(pwd -P "$0")/gnupg

echo "🗝 Setting up GPG."

if test -n "$CODESPACES"; then
  echo "🗝 GPG is already setup in Codespaces!"
  exit 0
fi

if ! test -d ~/.gnupg; then
  ln -s "$DIR" ~/.gnupg
fi

if ! command -v gpg >/dev/null; then
  echo "Install GPG first!" >&2
  exit 1
fi

if ! test -f "$DIR"/private.pgp; then
  op_get Private/private.pgp .gnupg/private.gpg
fi

if ! gpg --list-keys | grep 'F3C0CE23258159D3'; then
  gpg --batch --import ~/.gnupg/public.gpg ~/.gnupg/private.gpg
fi
