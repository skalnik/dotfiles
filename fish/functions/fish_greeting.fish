function fish_greeting
  if type -q neofetch
    neofetch --disable de wm packages
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
