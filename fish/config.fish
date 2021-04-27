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

fish_add_path --append ~/.dotfiles/bin
set -g fish_user_paths '.git/safe/../../bin' '.git/safe/../../node_modules/.bin' $fish_user_paths
