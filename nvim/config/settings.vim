"""""""""""""""""""
"" General Settings
"""""""""""""""""""

" Completion
""""""""""""
set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

set timeoutlen=400

set history=1000
set noerrorbells

" Search
""""""""
set ignorecase     " Ignore case by default
set smartcase      " Ignore case if all lower, else pay attention to case
set incsearch      " Incremental search
set hlsearch       " Highlight results permenantly

" Editing
"""""""""
" automatically indent lines and try to do it intelligently
set autoindent
set smartindent
" backspace behaves 'normally'
set backspace=indent,eol,start
" cursor keys also wrap
set whichwrap+=<,>,h,l
" custom custom invsible chars
set list listchars=tab:▸\ ,trail:·

" spaces instead of tabs
" prefer 2 spaces
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab

" Misc
""""""
" Configure backup & swap dirs
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Configure persistent undo
if has("persistent_undo")
  set undodir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
  set undofile
endif

" Vim wants a more POSIX-y shell. Give it one.
if &shell =~# 'fish$'
   set shell=bash
endif
