if type -q asdf
  source (brew --prefix)/opt/asdf/asdf.fish
end

set -gx EDITOR 'mvim -v'
set -U fish_user_paths '.git/safe/../../bin' '.git/safe/../../node_modules/.bin'
