if executable('rg')
  " Use ripgrep over grep
  set grepprg=rg\ --vimgrep
endif

" Map Cmd-Shift-F to project wide search
map <D-F> :grep<space>
