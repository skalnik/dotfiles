" Project wide search
"""""""""""""""""""""""

" With silent output:
"   Use vim's standard `grep` function
"   Don't open the first result (`!`)
"   Then open the quickfixlist with result
command -nargs=* ProjSearch silent grep! <args> | copen

" Map Cmd-Shift-F to project wide search.
map <D-F> :ProjSearch<space>

" Use ripgrep over grep if its around
if executable('rg')
  set grepprg=rg\ --vimgrep
endif
