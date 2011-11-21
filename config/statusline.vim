set laststatus=2   " always display a status line

function! Register()
  return substitute('[R'.v:register.']','^\[R\]$','','')
endfunction

set statusline=%<%f\ %m%r%h%w\ %= " Filename [modified][readonly][help][preview]
set statusline+=%#warningmsg#%{SyntasticStatuslineFlag()}%* "[Warning on Syntax Error]
set statusline+=%y%{Register()} "[filetype][register]
set statusline+=%([%l/%L,%v][%p%%]%) "[line#,col#][percent%]
