return {
  "dense-analysis/ale",
  config = function()
    vim.g.ale_sign_warning = '△'
    vim.g.ale_sign_error = '✖'
    vim.g.ale_sign_column_always = true
    vim.g.ale_hover_cursor = true
    vim.g.ale_cursor_detail = true
    vim.g.ale_floating_preview = true
    vim.g.ale_floating_window_border = { '│', '─', '╭', '╮', '╯', '╰', '│', '─' }

    vim.g.ale_linters['javascript'] = { 'eslint', 'flow', 'prettier', 'prettier-eslint' }
    vim.g.ale_fixers['javascript'] = { 'eslint', 'prettier', 'prettier-eslint' }
    -- highlight link ALEWarningSign String
    -- highlight link ALEErrorSign Title
  end
}
