" Always display and search dotfiles/dotdirectories
let g:ctrlp_dotfiles = 1

" Don't show any more than 25 matches at once
let g:ctrlp_max_height = 25

" Don't persist input string
let g:ctrlp_persistent_input = 0

noremap <leader>t <Esc>:CtrlP<CR>
