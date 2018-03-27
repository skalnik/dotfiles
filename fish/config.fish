status --is-interactive; and source (rbenv init -|psub)
status --is-interactive; and source (nodenv init -|psub)

set -gx EDITOR 'mvim -v'
set -U fish_user_paths '.git/safe/../../bin' $fish_user_paths
