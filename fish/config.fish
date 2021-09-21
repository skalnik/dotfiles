if type -q fd && type -q rg
  set -gx FZF_DEFAULT_COMMAND 'fd --type file --hidden --exclude .git'
end

if type -q mvim
  set -gx EDITOR 'mvim -v'
end

if type -q gpg
  set -gx GPG_TTY (tty)
end

if test -z "$CODESPACES"
  fish_add_path "/usr/local/bin" "/usr/local/sbin"
  fish_add_path --append ~/.dotfiles/bin
else
  fish_add_path --apend /workspaces/.codespaces/.persistedshare/dotfiles/bin
end

set -px fish_user_paths '.git/safe/../../bin'

if type -q asdf
  source (brew --prefix asdf)"/asdf.fish"
end
