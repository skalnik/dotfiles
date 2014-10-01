" Make the top match be at the top
let g:ctrlp_match_window_reversed = 1
" Show 25 results
let g:ctrlp_max_height = 10
" Lets use git to figure out what files you have
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co']

" Only use the nearest parent dir with a .git folder
let g:ctrlp_working_path_mode = 0

" let g:ctrlp_custom_ignore = '\v\.?(vendor|git)'
"
" " fuzzy matching settings
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

" " Ignore vendored shit
" set wildignore+=vendor/gems/*
" set wildignore+=vendor/gem/*
" set wildignore+=vendor/cache/*
" set wildignore+=tmp/*

map <Leader>t :CtrlP<CR>

