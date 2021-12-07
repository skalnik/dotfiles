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

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ ['darkestgreen', 'brightgreen', 'bold'], ['white', 'gray4'] ]
let s:p.normal.right = [ ['gray5', 'gray10'], ['gray9', 'gray4'], ['gray8', 'gray2'] ]
let s:p.inactive.right = [ ['gray1', 'gray5'], ['gray4', 'gray1'], ['gray4', 'gray0'] ]
let s:p.inactive.left = s:p.inactive.right[1:]
let s:p.insert.left = [ ['darkestcyan', 'white', 'bold'], ['white', 'darkblue'] ]
let s:p.insert.right = [ [ 'darkestcyan', 'mediumcyan' ], [ 'mediumcyan', 'darkblue' ], [ 'mediumcyan', 'darkestblue' ] ]
let s:p.insert.middle = [ [ 'mediumcyan', 'darkestblue' ] ]
let s:p.replace.left = [ ['white', 'brightred', 'bold'], ['white', 'gray4'] ]
let s:p.visual.left = [ ['darkred', 'brightorange', 'bold'], ['white', 'gray4'] ]
let s:p.normal.middle = [ [ 'gray7', 'gray2' ] ]
let s:p.replace.middle = s:p.normal.middle
let s:p.replace.right = s:p.normal.right
let s:p.tabline.left = [ [ 'gray9', 'gray4' ] ]
let s:p.tabline.tabsel = [ [ 'gray9', 'gray1' ] ]
let s:p.tabline.middle = [ [ 'gray2', 'gray8' ] ]
let s:p.tabline.right = [ [ 'gray9', 'gray3' ] ]
let s:p.normal.error = [ [ 'gray2', 'brightestred' ] ]
let s:p.normal.warning = [ [ 'gray1', '#FFFFB6' ] ]
let g:lightline#colorscheme#custom#palette = lightline#colorscheme#fill(s:p)

let g:lightline = {
  \  'colorscheme': 'one',
  \  'active': {
  \     'left': [ [ 'mode', 'paste' ], [ 'filename', 'modified' ] ],
  \     'right': [ [ 'lineinfo' ], [ 'percent' ], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok'] ]
  \  },
  \  'inactive': {
  \     'left': [ [ 'filename' ] ],
  \     'right': [ [ 'lineinfo' ], [ 'percent' ] ]
  \  },
  \  'component_function': {
  \     'mode': 'LightlineMode',
  \     'filename': 'LightlineFilename',
  \     'modified': 'LightlineModified',
  \  },
  \  'component_expand': {
  \     'readonly': 'LightlineRO',
  \     'linter_warnings': 'LightlineLinterWarnings',
  \     'linter_errors': 'LightlineLinterErrors',
  \     'linter_ok': 'LightlineLinterOK'
  \  },
  \  'component_type': {
  \     'readonly': 'error',
  \     'linter_errors': 'error',
  \     'linter_warnings': 'warning'
  \  }
  \}
