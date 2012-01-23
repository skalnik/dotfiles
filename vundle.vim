set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'


" File Navigation
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'scrooloose/nerdtree'
Bundle 'mileszs/ack.vim'

" Editing
Bundle "Lokaltog/vim-easymotion"
Bundle 'MSch/delimitMate'
Bundle 'UltiSnips'
Bundle 'godlygeek/tabular'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'

" File Specific
Bundle 'bbommarito/vim-slim'
Bundle 'tpope/vim-rails'
Bundle 'kana/vim-textobj-user'
Bundle 'kchmck/vim-coffee-script'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'gregsexton/MatchTag'
Bundle 'tpope/vim-markdown'

" Looks
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'skalnik/vim-irblack'
Bundle 'Lokaltog/vim-powerline'

" Misc
Bundle 'scratch.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'robgleeson/hammer.vim'

filetype plugin indent on
