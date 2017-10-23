" Show 25 results
let g:ctrlp_max_height = 10
" Lets use git to figure out what files you have
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

" Only use the nearest parent dir with a .git folder
let g:ctrlp_working_path_mode = 0

" No cross-project MRU files
let g:ctrlp_mruf_relative = 1

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\.DS_Store$',
  \ }

map <Leader>t :CtrlPMixed<CR>

let g:ctrlp_buffer_func = {
    \ 'enter': 'HideStatus',
    \ 'exit':  'ShowStatus',
    \ }

function! HideStatus()
    set laststatus=0
endfunc

function! ShowStatus()
    set laststatus=2
endfunc
