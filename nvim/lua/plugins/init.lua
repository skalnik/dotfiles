return {
  "editorconfig/editorconfig-vim",
  { "tpope/vim-endwise", event = "BufReadPost" },
  "jparise/vim-graphql",
  { "tpope/vim-fugitive", event = "VeryLazy" },
  { "tpope/vim-rhubarb", event = "VeryLazy" },

  { "dag/vim-fish", ft = "fish" },
  { "fatih/vim-go", build = ":GoUpdateBinaries", ft = "go" },
  { "joker1007/vim-ruby-heredoc-syntax", ft = { "ruby", "erb" } },
  { "kchmck/vim-coffee-script", ft = "coffeescript" },

  { "tpope/vim-vinegar", keys = "-" },
  { "vim-scripts/Align", cmd = "Align" },
  { "tversteeg/registers.nvim", config = true, event = "BufEnter" },
  { "kyazdani42/nvim-web-devicons", config = true },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", event = "BufReadPost" },

  {
    "folke/trouble.nvim",
    config = true,
    keys = {
      { "<leader>xx", "<CMD>TroubleToggle<CR>", { silent = true, noremap = true } },
    },
  },
}
