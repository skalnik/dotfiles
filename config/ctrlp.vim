" Show 25 results
let g:ctrlp_max_height = 10
" Lets use git to figure out what files you have
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']


" Only use the nearest parent dir with a .git folder
let g:ctrlp_working_path_mode = 0

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\.DS_Store$',
  \ }

map <Leader>t :CtrlP<CR>

