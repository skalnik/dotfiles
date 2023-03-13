return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("gitsigns").setup({
      signcolumn = true,
      current_line_blame = true,
    })
  end,
}
