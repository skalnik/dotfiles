call plug#begin()

" File Navigation
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
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
Plug 'skalnik/vim-emoji'
Plug 'vim-scripts/scratch.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/vim-peekaboo'

call plug#end()
