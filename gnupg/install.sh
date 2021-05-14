#!/bin/sh

DIR="$(pwd -P $0)"

echo "🗝 Setting up GPG."
if ! test -d ~/.gnupg; then
  ln -s $(pwd) ~/.gnupg
fi

if ! command -v gpg >/dev/null; then
  echo "Install GPG first!" >&2
  exit 1
fi

if ! test -f "$DIR/private.pgp"; then
  op_get tnm423degjcafahjmyjogzwyjy .gnupg/private.gpg
fi

if ! gpg --list-keys | grep 'F3C0CE23258159D3'; then
  gpg --import ~/.gnupg/public.gpg ~/.gnupg/private.gpg
fi
