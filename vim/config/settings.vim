"""""""""""""""""""
"" General Settings
"""""""""""""""""""

" Completion
""""""""""""
set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

set timeoutlen=400

" Display
"""""""""
colorscheme onedark

set number         " show line numbers
set ruler          " display coordinates in status bar
set showcmd        " display unfinished commands
set showmatch      " show matching bracket (briefly jump)
set noshowmode     " don't display the current mode in the status bar
set title          " show file in titlebar
set scrolloff=10   " keep 10 lines of text above/below the cursor when near the top/bottom of buffer
set laststatus=2   " Always show the status bar

" Setup fancy colors
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Fix cursor shape not switching
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

set fillchars+=vert:\│ " Nicer split char

set hidden
set history=1000
set noerrorbells
set mouse=a
set ttymouse=xterm2

set winheight=5
set winminheight=5
set winheight=999
set winwidth=80

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

" automatically reload a file if it's changed outside vim
set autoread

" wrap settings
set nowrap       " wrap lines rather than use horiz. scrolling
set linebreak    " try not to wrap in the middle of a word
set textwidth=80 " 80-character lines maximum
set nojoinspaces " Only 1 space after sentences instead of 2

" Misc
""""""
" highlight the current line in current window
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" Make line numbers relative to the current line
autocmd BufEnter * set relativenumber

" Configure backup & swap dirs
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Configure persistent undo
if has("persistent_undo")
   set undodir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
   set undofile
endif

" Stop annoying me every time I have a file open in two different vim sessions.
" 'e' is "Edit Anyway" in this circumstance. Other options you could use here:
" 'q' - quit.
" 'o' - open the file in read-only mode.
" 'r' - recover the changes.
augroup SimultaneousEdits
   autocmd!
   autocmd  SwapExists  *  :let v:swapchoice = 'e'
augroup END

" Vim wants a more POSIX-y shell. Give it one.
if &shell =~# 'fish$'
    set shell=bash
endif
