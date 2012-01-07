let g:nerdtree_tabs_open_on_gui_startup=0
let g:nerdtree_tabs_open_on_new_tab=1
let g:nerdtree_tabs_smart_startup_focus = 1

map <Leader>n :NERDTreeTabsToggle<CR>

autocmd VimEnter * call s:OpenIfNoFile()

function s:OpenIfNoFile()
  if 0 == argc()
    NERDTreeTabsToggle
  endif
endfunction
