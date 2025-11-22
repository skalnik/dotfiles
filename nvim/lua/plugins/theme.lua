return {
  {
    "kepano/flexoki-neovim",
    name = "flexoki",
    lazy = false,
    config = function()
      vim.cmd("colorscheme flexoki-dark")
    end,
  },
  {
    "TaDaa/vimade",
    dependencies = { "kepano/flexoki-neovim" },
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
  {
    "f-person/auto-dark-mode.nvim",
    dependencies = { "kepano/flexoki-neovim" },
    event = "VeryLazy",
    lazy = true,
    config = function()
      require('auto-dark-mode').setup({
        set_light_mode = function()
          vim.cmd("colorscheme flexoki-light")
        end,
        set_dark_mode = function()
          vim.cmd("colorscheme flexoki-dark")
        end,
      })
    end,
  }
}
