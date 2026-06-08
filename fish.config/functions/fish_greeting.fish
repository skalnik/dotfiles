function fish_greeting
  if type -q fortune && type -q cowsay
    if test -f ~/.dotfiles/fortune/fortune.dat
      fortune ~/.dotfiles/fortune/fortune | cowsay
    else
      fortune | cowsay
    end
  else if type -q fastfetch
    fastfetch
  else
    echo
    echo "┌──────────────────┐"
    echo "│ Welcome to fish! │"
    echo "│        🐟        │"
    echo "└────────╥─────────┘"

    echo "  (\__/) ║"
    echo "  (•ㅅ•) ║"
    echo "  /     づ"
  end
end
