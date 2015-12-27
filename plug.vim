set rtp+=~/.vim/bundle/vundle/
call plug#begin()

" File Navigation
Plug 'mileszs/ack.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Editing
Plug 'Align'

" File Specific
Plug 'kchmck/vim-coffee-script'

" Looks
Plug 'bling/vim-airline'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'skalnik/vim-irblack'

" Misc
Plug 'scratch.vim'

call plug#end()
