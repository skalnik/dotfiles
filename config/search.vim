if executable('rg')
  " Use ripgrep over grep
  set grepprg=rg\ --vimgrep
endif

" Project wide search:
" With silent output
" Use vim's standard `grep`
" But don't open the first result (`!`)
" and then open the quickfix list
command -nargs=* ProjSearch silent grep! <args> | copen

" Map Cmd-Shift-F to project wide search.
map <D-F> :ProjSearch<space>
