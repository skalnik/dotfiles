" Always display and search dotfiles/dotdirectories
let g:CommandTAlwaysShowDotFiles = 1
let g:CommandTScanDotDirectores = 1

" Don't show any more than 25 matches at once
let g:CommandTMaxHeight=25

map <Leader>t :CommandT<CR>
map <leader>gv :CommandT app/views<CR>
map <leader>gc :CommandT app/controllers<CR>
map <leader>gm :CommandT app/models<CR>
map <leader>gh :CommandT app/helpers<CR>
map <leader>gl :CommandT lib<CR>
map <leader>gp :CommandT public<CR>
map <leader>gs :CommandT public/stylesheets/sass<CR>
map <leader>gf :CommandT features<CR>
