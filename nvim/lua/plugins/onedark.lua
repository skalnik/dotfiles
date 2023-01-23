return {
  {
    "navarasu/onedark.nvim",
    lazy = false,
    config = function()
      local colors = require("onedark.palette").dark
      local onedark = require("onedark")
      onedark.setup({
        highlights = {
          ["FloatBorder"] = { bg = colors.bg0 },
          ["NormalFloat"] = { bg = colors.bg0 },
        },
      })

      onedark.load()
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
        highlight_ignore_patterns = { "WinSeparator", "EndOfBuffer" },
      })
    end,
  },
}
