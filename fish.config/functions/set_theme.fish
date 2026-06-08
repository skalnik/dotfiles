function set_theme
  set --local desired flexoki-light
  if defaults read -g AppleInterfaceStyle &>/dev/null
    set desired flexoki-dark
  end

  # --force bootstraps regardless of cached state; used at session start
  # so the color universals are guaranteed in sync with $FISH_THEME.
  if test "$FISH_THEME" = "$desired"; and not contains -- --force $argv
    return
  end

  set -Ux FISH_THEME $desired
  fish_config theme choose $FISH_THEME
end
