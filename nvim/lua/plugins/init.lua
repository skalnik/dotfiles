return {
  { "tpope/vim-vinegar", keys = "-" },

  { "vim-scripts/Align", cmd = "Align" },
  "editorconfig/editorconfig-vim",
  "github/copilot.vim",
  "tpope/vim-endwise",

  "jparise/vim-graphql",
  "sheerun/vim-polyglot",

  { "dag/vim-fish", ft = "fish" },
  { "fatih/vim-go", build = ":GoUpdateBinaries" },
  { "joker1007/vim-ruby-heredoc-syntax", ft = { "ruby", "erb" } },
  { "kchmck/vim-coffee-script", ft = "coffeescript" },

  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  { "tversteeg/registers.nvim", config = true },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  "kyazdani42/nvim-web-devicons",
  { "folke/trouble.nvim", config = true },
}
