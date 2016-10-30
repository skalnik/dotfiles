if executable('rg')
  " Use ripgrep over grep
  set grepprg=rg\ --vimgrep
endif

" Map Cmd-Shift-F to project wide search. `!` at the end makes it not open first
" result by default.
map <D-F> :grep!<space>
