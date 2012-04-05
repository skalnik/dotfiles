let mapleader = ","

" Jump between files with ,,
nnoremap <leader><leader> <c-^>

" Shift Enter to get out of INSERT
inoremap <S-CR> <Esc>

" Underline the current line with '='
nmap <silent> <leader>ul :t.\|s/./=/g\|:nohls<cr>

" Search
""""""""
" Clear highlight from search
noremap <CR> :nohlsearch<CR>

" Capital direction brings you to start or end
noremap H ^
noremap L $

" Windows
"""""""""
" Adjust windows to be same size
map <Leader>= <C-w>=

" Add shortcuts to move around windows faster
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>

" Split Gemfile above all others
""""""""""""""""""""""""""""""""
map <leader>gg :topleft 100 :split Gemfile<CR>
