function! InNERDTree()
  return &filetype ==? 'nerdtree'
endfunction

function! LightlineMode()
  return InNERDTree() ? 'NERDTree' : lightline#mode()
endfunction

function! LightlineRO()
  return &readonly ? '🔒' : ''
endfunction

function! LightlineFilename()
  if InNERDTree()
    return ''
  elseif expand('%:t') ==# ''
    return '[No Name]'
  else
    return expand('%:t')
  endif
endfunction

function! LightlineModified()
  if InNERDTree()
    return ''
  else
    return &modified ? '+' : (&modifiable ? '' : '-')
  endif
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFileencoding()
  if winwidth(0) > 70
    return &fenc !=# '' ? &fenc : &enc
  else
    return ''
  end
endfunction

function! LightlineFiletype()
  if winwidth(0) > 70
    return &filetype !=# '' ? &filetype : 'no ft'
  else
    return ''
  endif
endfunction

let g:lightline = {
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'readonly', 'filename', 'modified' ] ],
    \   'right': [ [ 'lineinfo' ],
    \              [ 'percent' ],
    \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
    \ },
    \ 'inactive': {
    \   'left': [ [ 'filename' ] ],
    \   'right': [ [ 'lineinfo' ],
    \              [ 'percent' ] ]
    \ },
    \ 'component_function': {
    \   'mode': 'LightlineMode',
    \   'readonly': 'LightlineRO',
    \   'filename': 'LightlineFilename',
    \   'modified': 'LightlineModified',
    \   'fileformat': 'LightlineFileformat',
    \   'fileencoding': 'LightlineFileencoding',
    \   'filetype': 'LightlineFiletype',
    \ } }
