return {
  {
    "navarasu/onedark.nvim",
    config = function()
      require("onedark").load()
    end,
  },
  {
    "levouh/tint.nvim",
    requires = { "navarasu/onedark.nvim" },
    event = "VeryLazy",
    lazy = true,
    config = function()
      vim.api.nvim_set_hl(0, "NormalNC", { link = "Normal" })

      require("tint").setup({
        highlight_ignore_patterns = { "WinSeparator", "EndOfBuffer" }
      })
    end
  }
}
