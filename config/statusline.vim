set laststatus=2   " always display a status line

set statusline=%<\ %f\ %m%r%h%w\ %= " Filename [modified][readonly][help][preview]
set statusline+=%({%{v:register}%Y}%) " {FILETYPE,branch}
set statusline+=\ %([%l/%L,%v]\ [%p%%]\ %) " [line#,col#][percent%]
