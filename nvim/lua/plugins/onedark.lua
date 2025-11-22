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
    "TaDaa/vimade",
    dependencies = { "navarasu/onedark.nvim" },
    event = "VeryLazy",
    lazy = true,
    config = function()
      require("vimade").setup({
        ncmode = 'windows',
        recipe = {
          "default", { animate = true }
        }
      })
    end,
  },
}
