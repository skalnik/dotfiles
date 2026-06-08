#!/bin/sh

set -eu

# shellcheck disable=SC1007  # CDPATH= is an environment prefix for cd. It is not an assignment.
DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)

echo "🐣 Ensuring bash is setup."

# Use -s only. The -d option applies to hard links.
if [ ! -e ~/.bash ]; then
  ln -s "$DIR" ~/.bash
fi
