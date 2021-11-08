if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

colorscheme onedark

set number         " show line numbers
set showcmd        " display unfinished commands
set showmatch      " show matching bracket (briefly jump)
set noshowmode     " don't display the current mode in the status bar
set title          " show file in titlebar
set scrolloff=10   " keep 10 lines of text above/below the cursor when near the top/bottom of buffer
set laststatus=2

set hidden
set noerrorbells
set mouse=a

set winheight=5
set winminheight=5
set winheight=999
set winwidth=80

" Windows
"""""""""
" Adjust windows to be same size
map <Leader>= <C-w>=

" Add shortcuts to move around windows faster
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>

