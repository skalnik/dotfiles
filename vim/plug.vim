let plug_dir = '~/.vim/vim-plugged'

if has('nvim')
  let plug_dir = '~/.vim/nvim-plugged'
endif

call plug#begin(plug_dir)

" File Navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-grepper'
Plug 'tpope/vim-vinegar'

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

" Neovim Specific
if has('nvim')
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-cmp'
endif

call plug#end()
