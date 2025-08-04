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
  alias cat="bat"
  set -gx BAT_THEME "TwoDark"
end

if test -z "$CODESPACES"
  fish_add_path "/opt/homebrew/bin" "/usr/local/sbin"
  fish_add_path --append ~/.dotfiles/bin
  fish_add_path ~/go/bin
else
  fish_add_path -m /usr/local/bin
  fish_add_path --append "$WORKING_DIRECTORY"/bin
  fish_add_path --append /workspaces/.codespaces/.persistedshare/dotfiles/bin
end

# ASDF configuration code
if test -z $ASDF_DATA_DIR
  set _asdf_shims "$HOME/.asdf/shims"
else
  set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
  set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims

set -px fish_user_paths '.git/safe/../../bin'
set -gx VIRTUAL_ENV_DISABLE_PROMPT "TRUE"

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
