require('lualine').setup {
  options = {
    icons_enabled = false,
    section_separators = { left = '', right = '' },
    component_separators = { left = '|', right = '|' },
    extensions = { 'quickfix' },
    globalstatus = true,
  }
}

vim.opt.showmode = false
