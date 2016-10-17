if executable('rg')
  " Use ripgrep over grep
  set grepprg=rg\ --vimgrep
endif
