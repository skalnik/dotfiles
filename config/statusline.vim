set laststatus=2   " always display a status line

function! Rvm() " Modified from vim-rvm
  let ruby=matchstr($GEM_HOME, '[^/]*$')
  return substitute(ruby.',','^,$','','')
endfunction

function! Filetype()
  return substitute(','.&ft,'^,$','','')
endfunction


set statusline=%<\ %f\ %m%r%h%w\ %= " Filename [modified][readonly][help][preview]
set statusline+=%({%{Rvm()}R%{v:register}%{Filetype()}}%) " {rvm version,register in use,filetype}
set statusline+=%#warningmsg#%{SyntasticStatuslineFlag()}%* " [Warning on Syntax Error]
set statusline+=\ %([%l/%L,%v]\ [%p%%]\ %) " [line#,col#][percent%]
