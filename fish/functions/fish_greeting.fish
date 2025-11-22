function fish_greeting
  if type -q fortune && type -q fortune
    if test -f ~/.dotfiles/fortune/fortune.dat
      fortune ~/.dotfiles/fortune/fortune | cowsay
    else
      fortune | cowsay
    end
  else if type -q fastfetch
    fastfetch
  else
    if test -n "$CODESPACES"
      echo
      echo "┌────────────────────────┐"
      echo "│ Welcome to Codespaces! │"
      echo "│        💻️🚀            │"
      echo "└────────╥───────────────┘"
    else
      echo
      echo "┌──────────────────┐"
      echo "│ Welcome to fish! │"
      echo "│        🐟        │"
      echo "└────────╥─────────┘"
    end

    echo "  (\__/) ║"
    echo "  (•ㅅ•) ║"
    echo "  /     づ"
  end
end
