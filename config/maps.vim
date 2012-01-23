let mapleader = ","

" Search
""""""""
" Clear highlight from search
map <Leader>l :nohlsearch<CR>;

" Windows
"""""""""
" Adjust windows to be same size
map <Leader>= <C-w>=

" Add shortcuts to move around windows faster
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>
