function! InNERDTree()
  return &filetype ==? 'nerdtree'
endfunction

function! LightlineMode()
  return InNERDTree() ? 'NERDTree' : lightline#mode()
endfunction

function! LightlineRO()
  return &readonly ? '✖✎ ' : ''
endfunction

function! LightlineFilename()
  if InNERDTree()
    return ''
  elseif &filetype ==? 'qf'
    return '[Quick Fix]'
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

function! LightlineLinterWarnings() abort
  if LintIgnore()
    return ''
  endif

  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d △', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  if LintIgnore()
    return ''
  endif

  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✖', all_errors)
endfunction

function! LightlineLinterOK() abort
  if LintIgnore()
    return ''
  endif

  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓ ' : ''
endfunction

function! LintIgnore()
  return !has_key(g:ale_buffer_info, bufnr(''))
endfunction

let g:lightline = {
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ], [ 'filename', 'modified' ] ],
    \   'right': [ [ 'lineinfo' ], [ 'percent' ], ['readonly', 'linter_errors', 'linter_warnings', 'linter_ok'] ]
    \ },
    \ 'inactive': {
    \   'left': [ [ 'filename' ] ],
    \   'right': [ [ 'lineinfo' ],
    \              [ 'percent' ] ]
    \ },
    \ 'component_function': {
    \   'mode': 'LightlineMode',
    \   'filename': 'LightlineFilename',
    \   'modified': 'LightlineModified',
    \ },
    \ 'component_expand': {
    \   'readonly': 'LightlineRO',
    \   'linter_warnings': 'LightlineLinterWarnings',
    \   'linter_errors': 'LightlineLinterErrors',
    \   'linter_ok': 'LightlineLinterOK'
    \ },
    \ 'component_type': {
    \   'readonly': 'error',
    \ } }
