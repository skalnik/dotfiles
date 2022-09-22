local filename_section = {
  'filename',
  file_status = true,
  newfile_status = false,
  path = 1,
  shorting_target = 40,
  symbols = {
    modified = ' [📝]',
    readonly = ' [⛔]',
    unnamed = '[No Name]',
    newfile = '[✨]',
  }
}

require('lualine').setup {
  options = {
    icons_enabled = false,
    section_separators = { left = '', right = '' },
    component_separators = { left = '|', right = '|' },
    extensions = { 'quickfix' },
    globalstatus = true,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { filename_section },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { filename_section },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
}

vim.opt.showmode = false
