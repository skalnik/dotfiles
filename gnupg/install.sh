#!/bin/sh

set -eu

# shellcheck disable=SC1007  # CDPATH= is an environment prefix for cd. It is not an assignment.
DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)

KEY_ID=F3C0CE23258159D3
PRIVATE=$HOME/.gnupg/private.pgp

echo "🗝  Setting up GPG."

if test -n "${CODESPACES:-}"; then
  echo "🗝  GPG is already setup in Codespaces!"
  exit 0
fi

if ! command -v gpg >/dev/null; then
  echo "Install GPG first!" >&2
  exit 1
fi

mkdir -p "$HOME"/.gnupg
chmod 700 "$HOME"/.gnupg

for conf in gpg.conf gpg-agent.conf; do
  if [ ! -e "$HOME"/.gnupg/"$conf" ]; then
    echo "🔗 Linking ~/.gnupg/$conf → $DIR/$conf."
    ln -s "$DIR/$conf" "$HOME"/.gnupg/"$conf"
  fi
done

if gpg --list-keys "$KEY_ID" >/dev/null 2>&1; then
  echo "🗝  Key $KEY_ID is already in the keyring."
  exit 0
fi

# Always remove the secret key file, also if an import fails.
trap 'rm -f "$PRIVATE"' EXIT INT TERM

echo "🗝  Importing key $KEY_ID."
gpg --batch --import "$DIR"/public.gpg

if [ ! -f "$PRIVATE" ]; then
  op_get Private/private.pgp .gnupg/private.pgp
fi

gpg --batch --import "$PRIVATE"

# An imported secret key has no owner trust. Set full trust for your own key.
fingerprint=$(gpg --with-colons --fingerprint "$KEY_ID" | awk -F: '/^fpr:/ { print $10; exit }')
echo "$fingerprint:6:" | gpg --batch --import-ownertrust
