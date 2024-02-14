function cat --description 'Replace `cat` with `bat` if available'
  if type -q bat
    command bat $argv
  else
    set --local CAT $(which cat)
    command $CAT $argv
  end
end
