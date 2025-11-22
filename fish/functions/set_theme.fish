function set_theme
  if defaults read -g AppleInterfaceStyle &>/dev/null
    set -Ux FISH_THEME "flexoki-dark"
    # dark mode
  else
    set -Ux FISH_THEME "flexoki-light"
  end

  fish_config theme choose $FISH_THEME
end
