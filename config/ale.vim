let g:ale_sign_warning = '⚠'
let g:ale_sign_error = '✖'
let g:ale_sign_column_always=1

highlight link ALEWarningSign String
highlight link ALEErrorSign Title

autocmd User ALELint call s:MaybeUpdateLightline()

function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction
