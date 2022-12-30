return {
  'nvim-lualine/lualine.nvim',
  config = function()
    local filename_section = {
      'filename',
      file_status = true,
      newfile_status = false,
      path = 1,
      shorting_target = 40,
      symbols = {
        modified = ' [📝]',
        readonly = ' [🚫]',
        unnamed = '[No Name]',
        newfile = '[✨]',
      }
    }
    local diagnostics = {
      'diagnostics',
      sources = { 'nvim_lsp', 'nvim_diagnostic', 'vim_lsp' },
      sections = { 'error', 'warn', 'info', 'hint' },
      diagnostics_color = {
        error = 'DiagnosticError',
        warn  = 'DiagnosticWarn',
        info  = 'DiagnosticInfo',
        hint  = 'DiagnosticHint',
      },
      symbols = {error = '✖ ', warn = '▲ ', info = 'ⓘ ', hint = '⚑ '},
      colored = true,
      update_in_insert = true,
      always_visible = false,
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
        lualine_b = { 'branch', 'diff', diagnostics },
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
  end
}
