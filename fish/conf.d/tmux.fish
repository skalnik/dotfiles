if test -z "$CODESPACES"; and not set -q TMUX; and not string match -q $TERM 'xterm-kitty'; and not string match -q $TERM 'xterm-ghostty'
    set -g TMUX tmux new-session -d -s base
    eval $TMUX
    tmux attach-session -d -t base
end
