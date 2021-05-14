if type -q fd && type -q rg
  set -gx FZF_DEFAULT_COMMAND 'fd -tf'
end

if type -q mvim
  set -gx EDITOR 'mvim -v'
end

if type -q gpg
  set -gx GPG_TTY (tty)
end

fish_add_path "/usr/local/bin" "/usr/local/sbin"
fish_add_path --append ~/.dotfiles/bin
set -px fish_user_paths '.git/safe/../../bin'

if type -q asdf
  source (brew --prefix asdf)"/asdf.fish"
end
