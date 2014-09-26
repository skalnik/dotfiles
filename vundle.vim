set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" File Navigation
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdtree'

" Editing
Bundle 'Align'
Bundle 'ervandew/supertab'
Bundle 'kana/vim-smartinput'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'

" File Specific
Bundle 'gregsexton/MatchTag'
Bundle 'juvenn/mustache.vim'
Bundle 'kana/vim-textobj-user'
Bundle 'kchmck/vim-coffee-script'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'puppetlabs/puppet-syntax-vim'
Bundle 'skalnik/vim-vroom'
Bundle 'sudar/vim-arduino-syntax'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'

" Looks
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'skalnik/vim-irblack'
Bundle 'Lokaltog/vim-powerline'

" Misc
Bundle 'scratch.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'matthias-guenther/hammer.vim'

filetype plugin indent on
