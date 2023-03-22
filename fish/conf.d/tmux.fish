if test -z "$CODESPACES"; and not set -q TMUX; and not string match -q $TERM 'xterm-kitty'
    set -g TMUX tmux new-session -d -s base
    eval $TMUX
    tmux attach-session -d -t base
end
