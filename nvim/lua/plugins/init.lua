return {
  "tpope/vim-vinegar",

  "vim-scripts/Align",
  "dense-analysis/ale",
  "editorconfig/editorconfig-vim",
  "github/copilot.vim",
  "tpope/vim-endwise",
  "neovim/nvim-lspconfig",
  "hrsh7th/nvim-cmp",

  "godlygeek/tabular",
  "jparise/vim-graphql",
  "sheerun/vim-polyglot",

  { "dag/vim-fish", ft = "fish" },
  { "fatih/vim-go", build = ":GoUpdateBinaries" },
  { "joker1007/vim-ruby-heredoc-syntax", ft = { "ruby", "erb" } },
  { "kchmck/vim-coffee-script", ft = "coffeescript" },
  { "plasticboy/vim-markdown", ft = "md" },

  {
    "navarasu/onedark.nvim",
    lazy = false,
    config = function()
      vim.cmd([[colorscheme onedark]])
    end
},
  "skalnik/vim-emoji",
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  "tversteeg/registers.nvim",
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
}
