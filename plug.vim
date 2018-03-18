set rtp+=~/.vim/bundle/vundle/
call plug#begin()

" File Navigation
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mhinz/vim-grepper'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Editing
Plug 'vim-scripts/Align'
Plug 'w0rp/ale'

" Filetype Specific
Plug 'dag/vim-fish'
Plug 'joker1007/vim-ruby-heredoc-syntax'
Plug 'jparise/vim-graphql'
Plug 'kchmck/vim-coffee-script'

" Looks
Plug 'itchyny/lightline.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'skalnik/vim-irblack'

" Misc
Plug 'junegunn/vim-emoji'
Plug 'vim-scripts/scratch.vim'

call plug#end()
