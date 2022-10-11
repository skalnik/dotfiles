let g:ale_sign_warning = '△'
let g:ale_sign_error = '✖'
let g:ale_sign_column_always=1
let g:ale_hover_cursor = 1
let g:ale_cursor_detail = 1
let g:ale_floating_preview = 1
let g:ale_floating_window_border=['│', '─', '╭', '╮', '╯', '╰', '│', '─']


highlight link ALEWarningSign String
highlight link ALEErrorSign Title

call ale#linter#Define('eruby', {
  \   'name': 'erubylint',
  \   'executable': 'erb',
  \   'output_stream': 'stderr',
  \   'command': "ruby -rerb -e \"puts ERB.new(File.read(%t, encoding: 'BINARY').gsub('<%=','<%'), nil, '-').src\" | ruby -c",
  \   'callback': 'ale#handlers#ruby#HandleSyntaxErrors',
  \})

if !exists('g:ale_linters')
  let g:ale_linters = {}
endif
let g:ale_linters['eruby'] = ['erubylint']
let g:ale_linters['javascript'] = ['eslint', 'flow', 'prettier', 'prettier-eslint']

if !exists('g:ale_fixers')
  let g:ale_fixers = {}
endif
let g:ale_fixers['javascript'] = ['eslint', 'prettier', 'prettier-eslint']

autocmd User ALELint call s:MaybeUpdateLightline()

function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction

function! UpdatePowerSaving()
  if executable('pmset')
    call system("pmset -g batt | head -1 | grep 'Battery'")
    if !v:shell_error
      let g:ale_lint_delay=10000
    else
      let g:ale_lint_delay=200
    endif
  endif
endfunction
