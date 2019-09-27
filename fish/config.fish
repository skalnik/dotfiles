if type -q asdf
  source (brew --prefix asdf)/asdf.fish
end

if type -q fzf && type -q rg
  set -gx FZF_DEFAULT_COMMAND 'rg --files'
end

if type -q mvim
  set -gx EDITOR 'mvim -v'
end

set -gxa PATH '.git/safe/../../bin' '.git/safe/../../node_modules/.bin' '/usr/local/sbin'
