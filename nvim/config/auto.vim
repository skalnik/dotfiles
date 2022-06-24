" Search
""""""""
" don't highlight search while in insert mode in current buffer
autocmd InsertEnter * :setlocal nohlsearch
autocmd InsertLeave * :setlocal hlsearch

" Misc
""""""
" highlight the current line in current window; may slow down redrawing for long lines or large files
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
