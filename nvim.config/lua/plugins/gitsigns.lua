return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  config = function()
    require("gitsigns").setup({
      current_line_blame = true,
    })
  end,
}
