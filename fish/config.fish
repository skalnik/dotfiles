set -Ux EDITOR 'mvim -v'

status --is-interactive; and source (rbenv init -|psub)
status --is-interactive; and source (nodenv init -|psub)
