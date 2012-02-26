let mapleader = ","

" Jump between files with ,,
nnoremap <leader><leader> <c-^>

" Search
""""""""
" Clear highlight from search
noremap <CR> :nohlsearch<CR>

" Windows
"""""""""
" Adjust windows to be same size
map <Leader>= <C-w>=

" Add shortcuts to move around windows faster
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>
