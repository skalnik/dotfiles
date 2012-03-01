function! PresentationModeOn()
  colorscheme solarized
  set bg=light

  set guifont=Monaco\ For\ Powerline:h25
endfunction

function! PresentationModeOff()
  colorscheme ir_black
  set bg=dark

  set guifont=Monaco\ For\ Powerline:h10
endfunction

function! TogglePresentationMode()
  if !exists('w:present')
    let w:present = 1
  endif

  if w:present == 0
    call PresentationModeOn()
    let w:present = 1
  else
    call PresentationModeOff()
    let w:present = 0
  endif
endfunction

map <leader>z :call TogglePresentationMode()<CR>
