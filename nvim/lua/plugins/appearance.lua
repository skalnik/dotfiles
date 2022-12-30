return {
  {
    "navarasu/onedark.nvim",
    requires = { "levouh/tint.nvim" },
    config = function()
      require("onedark").load()
    end,
  },
  {
    "levouh/tint.nvim",
    config = function()
      vim.api.nvim_set_hl(0, "NormalNC", { link = "Normal" })

      require("tint").setup({
        highlight_ignore_patterns = { "WinSeparator", "EndOfBuffer" }
      })
    end
  }
}

