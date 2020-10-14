#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "🗝 Setting up GPG."
echo $DIR
ln -s $DIR ~/.gnupg

if ! command -v gpg >/dev/null
then
  echo "Install GPG first!" >&2
  exit 1
fi

op_get tnm423degjcafahjmyjogzwyjy .gnupg/private.gpg

gpg --import ~/.gnupg/public.gpg ~/.gnupg/private.gpg
