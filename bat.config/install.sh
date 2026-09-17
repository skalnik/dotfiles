#!/bin/sh
set -euo pipefail

if ! command -v bat >/dev/null 2>&1; then
  echo "bat.config: bat is not installed, skipping theme cache build" >&2
  exit 0
fi

bat cache --build >/dev/null
echo "bat.config: rebuilt theme cache in $(bat --cache-dir)"
