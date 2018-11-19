if type -q asdf
  source (brew --prefix)/opt/asdf/asdf.fish
end

set -U fish_user_paths '.git/safe/../../bin' '.git/safe/../../node_modules/.bin'

set -gx EDITOR 'mvim -v'
set -gx FZF_DEFAULT_COMMAND 'rg --files'
