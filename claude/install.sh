#!/bin/sh

set -eu

# shellcheck disable=SC1007  # CDPATH= is an environment prefix for cd. It is not an assignment.
DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)

echo "🤖 Ensuring claude is setup."
if [ ! -e ~/.claude ]; then
  ln -s "$DIR" ~/.claude
fi
