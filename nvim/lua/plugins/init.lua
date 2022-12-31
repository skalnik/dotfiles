return {
  "editorconfig/editorconfig-vim",
  "tpope/vim-endwise",
  "jparise/vim-graphql",
  "sheerun/vim-polyglot",
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",

  { "dag/vim-fish", ft = "fish" },
  { "fatih/vim-go", build = ":GoUpdateBinaries", ft = "go" },
  { "joker1007/vim-ruby-heredoc-syntax", ft = { "ruby", "erb" } },
  { "kchmck/vim-coffee-script", ft = "coffeescript" },

  { "tpope/vim-vinegar", keys = "-" },
  { "vim-scripts/Align", cmd = "Align" },
  { "tversteeg/registers.nvim", config = true },
  { "kyazdani42/nvim-web-devicons", config = true },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", event = "BufReadPost" },

  {
    "folke/trouble.nvim",
    config = true,
    keys = {
      { "<leader>xx", "<CMD>TroubleToggle<CR>", { silent = true, noremap = true } },
    }
  },
}
