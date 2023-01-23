if type -q fd && type -q rg
  set -gx FZF_DEFAULT_COMMAND 'fd --type file --hidden --exclude .git'
end

if type -q nvim
  set -gx EDITOR 'nvim'
end

if type -q gpg
  set -gx GPG_TTY (tty)
end

if type -q bat
  set -gx BAT_THEME "TwoDark"
end

if test -z "$CODESPACES"
  fish_add_path "/usr/local/bin" "/usr/local/sbin"
  fish_add_path --append ~/.dotfiles/bin
  fish_add_path ~/go/bin
else
  eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
  fish_add_path -m /usr/local/bin
  fish_add_path --append "$WORKING_DIRECTORY"/bin
  fish_add_path --append /workspaces/.codespaces/.persistedshare/dotfiles/bin
  set -gx EDITOR '/home/linuxbrew/.linuxbrew/bin/nvim'
end

set -px fish_user_paths '.git/safe/../../bin'

if type -q asdf
  source (brew --prefix asdf)"/libexec/asdf.fish"
end
