return {
  'lukas-reineke/indent-blankline.nvim',
  setup = function()
    require("indent_blankline").setup {
      show_trailing_blankline_indent  = false,
      show_current_context = true,
      use_treesitter = true,
    }
  end
}