call plug#begin()

" File Navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-grepper'
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-vinegar'
"Plug 'mhinz/vim-startify'

" Editing
Plug 'vim-scripts/Align'
Plug 'dense-analysis/ale'
Plug 'editorconfig/editorconfig-vim'
Plug 'ojroques/vim-oscyank'
Plug 'tpope/vim-endwise'

" Filetype Specific
Plug 'dag/vim-fish'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'godlygeek/tabular'
Plug 'joker1007/vim-ruby-heredoc-syntax'
Plug 'jparise/vim-graphql'
Plug 'kchmck/vim-coffee-script'
Plug 'plasticboy/vim-markdown'
Plug 'sheerun/vim-polyglot'

" Looks
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
Plug 'skalnik/vim-irblack'
Plug 'joshdick/onedark.vim'

" Misc
Plug 'skalnik/vim-emoji'
Plug 'vim-scripts/scratch.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/vim-peekaboo'

call plug#end()
