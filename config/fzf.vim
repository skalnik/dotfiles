autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

let g:fzf_buffers_jump = 1
let g:fzf_files_options = '--preview "bat --color always --style numbers {}"'

nnoremap <D-t> :Files<CR>

