"""""""""""""""""""
"" General Settings
"""""""""""""""""""


" Completion
""""""""""""
set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Display
"""""""""
colorscheme ir_black

set laststatus=2   " always display a status line
set number         " show line numbers
set ruler          " display coordinates in status bar
set showcmd        " display unfinished commands
set showmatch      " show matching bracket (briefly jump)
set showmode       " display the current mode in the status bar
set title          " show file in titlebar
set scrolloff=10   " keep 10 lines of text above/below the cursor when near the top/bottom of buffer

set hidden
set history=100
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
set list listchars=tab:▸\ ,eol:¬,trail:·

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


" Misc
""""""
" highlight the current line in current window; may slow down redrawing for long lines or large files
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
" set leader to ,
let mapleader = ","
" Automatically restore cursor position when possible
autocmd BufReadPost *
   \ if line("'\"") > 1 && line("'\"") <= line("$") |
   \ exe "normal! g`\"" |
   \ endif
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Configure undo files
if has("persistent_undo")
   set undodir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
   set undofile
endif

""
" Stop annoying me every time I have a file open in two different vim sessions.
" 'e' is "Edit Anyway" in this circumstance. Other options you could use here:
" 'q' - quit.
" 'o' - open the file in read-only mode.
" 'r' - recover the changes.
augroup SimultaneousEdits
   autocmd!
   autocmd  SwapExists  *  :let v:swapchoice = 'e'
augroup END
