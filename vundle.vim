set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'


" File Navigation
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'scrooloose/nerdtree'
Bundle 'mileszs/ack.vim'

Bundle 'duff/vim-bufonly'

" Editing
Bundle 'scrooloose/nerdcommenter'
Bundle 'godlygeek/tabular'
Bundle 'scrooloose/syntastic'
Bundle 'msanders/snipmate.vim'
Bundle 'sjl/gundo.vim'
Bundle 'delimitMate.vim'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-rails'
Bundle 'robgleeson/hammer.vim'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'

" Looks
Bundle 'skalnik/vim-irblack'
Bundle 'nathanaelkane/vim-indent-guides'

" Misc
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rvm'
Bundle 'scratch.vim'
Bundle 'mattn/gist-vim'

filetype plugin indent on
