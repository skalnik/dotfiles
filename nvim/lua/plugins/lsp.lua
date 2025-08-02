return {
  {
    'neovim/nvim-lspconfig'
  },
	{
    'mason-org/mason.nvim',
    config = function()
      require('mason').setup()
    end
  },
	{
    'mason-org/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup()
    end
  },
	{
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
      'mason-org/mason.nvim',
      'mason-org/mason-lspconfig.nvim',
    },
    lazy = false,
    config = function()
      vim.lsp.enable('gopls')
      require('mason-tool-installer').setup({
        ensure_installed = {
          "gopls",
        }
      })
    end
  },
  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    lazy = false,

    version = '1.*',
    opts = {
      keymap = { preset = 'default' },
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  }
}
