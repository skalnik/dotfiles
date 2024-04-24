function fish_user_key_bindings
  if test -n "$CODESPACES"
    return
  end

  fzf --fish | source
end
