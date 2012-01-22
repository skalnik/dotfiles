" Always display and search dotfiles/dotdirectories
let g:CommandTAlwaysShowDotFiles = 1
let g:CommandTScanDotDirectores = 1

" Show the match window at the top of the screen rather than the bottom
let g:CommandTMatchWindowAtTop = 1

" Don't show any more than 25 matches at once
let g:CommandTMaxHeight=25

noremap <Leader>T :CommandTFlush<CR>
noremap <Leader>t :CommandT<CR>
