return {
  "godlygeek/tabular",
  {
    "plasticboy/vim-markdown",
    dependencies = {
      "godlygeek/tabular",
    },
    ft = "markdown",
    config = function()
      vim.g.vim_markdown_folding_disabled = 1
      vim.g.vim_markdown_conceal = 0
      vim.g.vim_markdown_folding_level = 6
    end
  },
}
