#!/usr/bin/env bash
set -euo pipefail

echo "📯 Updating vim plugins"

cd "$(dirname "$0")"
PACK_DIR="pack/vendor/start"
mkdir -p "$PACK_DIR"

grep -vE '^[[:space:]]*(#|$)' plugins.txt | while IFS= read -r repo; do
  dest="$PACK_DIR/${repo##*/}"
  echo "📦 $repo"
  rm -rf "$dest"
  mkdir -p "$dest"
  curl -fsSL "https://github.com/$repo/archive/HEAD.tar.gz" \
    | tar -xz -C "$dest" --strip-components=1
done

echo "✅ Done!"
