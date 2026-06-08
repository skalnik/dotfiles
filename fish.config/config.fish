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

fish_add_path "/opt/homebrew/bin" "/usr/local/sbin"
fish_add_path --append ~/.dotfiles/bin
fish_add_path ~/go/bin

# ASDF configuration code
if test -z $ASDF_DATA_DIR
  set _asdf_shims "$HOME/.asdf/shims"
else
  set _asdf_shims "$ASDF_DATA_DIR/shims"
end

set -gx ANSIBLE_VAULT_PASSWORD_FILE '~/.dotfiles/bin/.vault-pass'

# Do not use fish_add_path here because it potentially changes
# the order of items in PATH (we need the asdf shims prepended exactly)
if not contains $_asdf_shims $PATH
  set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims

fish_add_path --prepend '.git/safe/../../bin' "$HOME/.local/bin"
set -gx VIRTUAL_ENV_DISABLE_PROMPT "TRUE"

set_theme --force

if type -q ~/.config/op/plugins.sh
  source ~/.config/op/plugins.sh
end

# uv
fish_add_path "/Users/skalnik/.local/bin"

# Private settings that do not belong in a public repository. See local.fish.
if test -f $__fish_config_dir/local.fish
  source $__fish_config_dir/local.fish
end
