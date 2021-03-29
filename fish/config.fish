if type -q asdf
  source /usr/local/opt/asdf/asdf.fish
end

if type -q fd && type -q rg
  set -gx FZF_DEFAULT_COMMAND 'fd -tf'
end

if type -q mvim
  set -gx EDITOR 'mvim -v'
end

if type -q gpg
  set -gx GPG_TTY (tty)
end

set -g fish_user_paths $fish_user_paths ~/.dotfiles/bin
set -g fish_user_paths '.git/safe/../../bin' '.git/safe/../../node_modules/.bin' '/usr/local/sbin' $fish_user_paths
