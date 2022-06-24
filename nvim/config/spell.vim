autocmd BufRead,BufNewFile *.md setlocal spell
autocmd FileType gitcommit setlocal spell

for d in glob('~/.vim/spell/*.add', 1, 1)
  if filereadable(d) && (!filereadable(d . '.spl') || getftime(d) > getftime(d . '.spl'))
    exec 'mkspell! ' . fnameescape(d)
  endif
endfor
