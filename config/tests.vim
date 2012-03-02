function! RunTests(filename)
  " Write the file and run tests for the given filename
  :w
  :silent !echo;echo;echo;echo;echo
  if filereadable("script/test")
    exec ":!script/test " . a:filename
  else
    exec ":!bundle exec rspec " . a:filename . " --no-color"
  end
endfunction

function! SetTestFile()
  " Set the spec file that tests will be run for.
  let t:smh_test_file=@%
endfunction

function! RunTestFile(...)
  if a:0
    let command_suffix = a:1
  else
    let command_suffix = ""
  endif

  " Run the tests for the previously-marked file.
  let in_spec_file = match(expand("%"), '_spec.rb$') != -1
  if in_spec_file
    call SetTestFile()
  elseif !exists("t:smh_test_file")
    return
  end
  call RunTests(t:smh_test_file . command_suffix)
endfunction

function! RunNearestTest()
  let spec_line_number = line('.')
  call RunTestFile(":" . spec_line_number)
endfunction

map <leader>r :call RunTestFile()<cr>
map <leader>R :call RunNearestTest()<cr>
map <leader>a :call RunTests('spec')<cr>
map <leader>A :call RunTests('')<cr>
