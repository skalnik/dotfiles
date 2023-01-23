require("config")
require("bootstrap")
require("plugins")
require("lazy").setup("plugins", {
  defaults = {
    lazy = true,
  },
  ui = {
    border = "single",
  }
})
vim.cmd("runtime! config/**/*")
