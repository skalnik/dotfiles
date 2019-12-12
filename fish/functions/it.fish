function it --description 'Light punishment for a common `git` typo'
  echo "You meant to type `git`!"
  sleep 3
  git $argv
end
