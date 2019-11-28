function cat --description 'Replace `cat` with `bat` if available'
  if type -q bat
    command bat $argv
  end
end
