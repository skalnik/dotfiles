#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Link all linkable files
for linkable in $DIR/**/*.symlink
do
  target=$HOME"/."$(basename $linkable | sed 's/.symlink//')
  echo "Linking" $target "→" $linkable
  ln -Ff -s $linkable $target
done

for executable in $DIR/**/*.sh
do
  echo "Running" $executable
  sh $executable
done
