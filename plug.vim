set rtp+=~/.vim/bundle/vundle/
call plug#begin()

" File Navigation
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'mhinz/vim-grepper'

" Editing
Plug 'Align'
Plug 'w0rp/ale'

" Filetype Specific
Plug 'kchmck/vim-coffee-script'
Plug 'dag/vim-fish'
Plug 'joker1007/vim-ruby-heredoc-syntax'
Plug 'jparise/vim-graphql'

" Looks
Plug 'itchyny/lightline.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'skalnik/vim-irblack'

" Misc
Plug 'scratch.vim'
Plug 'junegunn/vim-emoji'

call plug#end()
