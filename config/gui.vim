if has("gui_running")
  if has("gui_macvim")
    set fuoptions=maxvert,maxhorz 
    set guifont=Monaco:h10 
    set guioptions-=T " remove toolbar
    set guioptions-=r " remove scrollbars
    set guioptions-=L
    set stal=1        " Show tab bar if more than 1 tab
  end

  set anti

  " Default size of window
  set columns=140
  set lines=50

  set transp=5

  " Love this for adjusting from laptop to desktop monitor
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

  " Adjust windows to be same size
  map <Leader>= <C-w>=

  macmenu File.New\ Tab key=<nop>

  map <D-t> :CommandT<CR>

  nmap <silent> <C-h> :wincmd h<CR>
  nmap <silent> <C-j> :wincmd j<CR>
  nmap <silent> <C-k> :wincmd k<CR>
  nmap <silent> <C-l> :wincmd l<CR>
endif
