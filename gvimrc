if has("gui_macvim")
  " OS X only font
  set guifont=Monaco:h10

  " Rebind Cmd+T to Command T
  macmenu &File.New\ Tab key=<nop>
  map <D-t> :CommandT<CR>
end

set fuoptions=maxvert,maxhorz
set guioptions-=T  " Remove toolbar
set guioptions-=rL " Remove scrollbars
set stal=1         " Show tab bar if more than 1 tab

set anti           " Yummy anti-aliased fonts

" Default size of window
set columns=140
set lines=50
set transp=7       " Slight transparency


" Good for switching between wide and skinny
function! Change_size()
 if !exists('w:wide')
   let w:wide = 0
 endif
 if w:wide == 1
   set columns=140
   let w:wide = 0
 else
   set columns=260
   let w:wide = 1
 endif
endfunction

map <leader>w :call Change_size()<CR>
