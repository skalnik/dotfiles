return {
  'lewis6991/gitsigns.nvim',
  requires = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('gitsigns').setup {
      signcolumn = true,
      current_line_blame = true,
    }
  end
}