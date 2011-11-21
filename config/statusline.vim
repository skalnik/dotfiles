set laststatus=2   " always display a status line

set statusline=%<\ %f\ %m%r%h%w\ %= " Filename [modified][readonly][help][preview]
set statusline+=%{rvm#statusline()}\%y[R%{v:register}] "[rvm][filetype][register]
set statusline+=%#warningmsg#%{SyntasticStatuslineFlag()}%* "[Warning on Syntax Error]
set statusline+=%([%l/%L,%v][%p%%]\ %) "[line#,col#][percent%]
