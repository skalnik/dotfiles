function fish_title
  set --local title
  if test (status current-command) = 'fish'
    set title (prompt_pwd)
  else
    set title (status current-command)
  end

  echo $title

  if test -n "$TMUX"
    tmux rename-window $title
  end
end
