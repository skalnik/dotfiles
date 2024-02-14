function fish_user_key_bindings
  if test -n "$CODESPACES"
    return
  end

  fzf_key_bindings
end
