set rtp+=~/.vim/bundle/vundle/
call plug#begin()

" File Navigation
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'mhinz/vim-grepper'

" Editing
Plug 'Align'
Plug 'w0rp/ale'

" File Specific
Plug 'kchmck/vim-coffee-script'

" Looks
Plug 'itchyny/lightline.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'skalnik/vim-irblack'

" Misc
Plug 'scratch.vim'

call plug#end()
