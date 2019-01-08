#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if ! command -v brew &> /dev/null; then
  echo '🍺 Installing Homebrew.'
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if ! brew bundle check; then
  echo '📦 Running `brew bundle install` to install desired packages.'
  brew bundle install
fi

# Link all linkable files
for linkable in $DIR/**/*.symlink; do
  target=$HOME"/."$(basename $linkable | sed 's/.symlink//')
  echo "🔗 Linking $target → $linkable."
  ln -Ff -s $linkable $target
done

for executable in $DIR/**/*.sh; do
  echo "👟 Running $executable."
  sh $executable
done

