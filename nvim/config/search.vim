" Project wide search
"""""""""""""""""""""""

" With silent output:
"   Use vim's standard `grep` function
"   Don't open the first result (`!`)
"   Then open the quickfixlist with result
command -nargs=* -complete=file ProjSearch silent grep! <args> | copen

" Map ,ff to project wide search.
"map <D-F> :GrepperRg<space>
map <leader>ff :GrepperRg<space>

map <leader>f <cmd>Telescope live_grep<cr>
"map <leader>f :Rg<space>

" Use ripgrep over grep if its around
if executable('rg')
  set grepprg=rg\ --vimgrep
endif

" File search
"""""""""""""
" Clear highlight
nnoremap <CR> :nohlsearch<CR>

" Restore <CR> functionality in other places
augroup enter_esc
  au!
  au BufReadPost quickfix nnoremap <buffer> <CR> <CR>
  au CmdWinEnter * nnoremap <buffer> <CR> <CR>
augroup END
