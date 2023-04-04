return {
  'VonHeikemen/lsp-zero.nvim',
  event = "BufRead",
  branch = 'v1.x',
  dependencies = {
    {'neovim/nvim-lspconfig'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    { "jose-elias-alvarez/null-ls.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'saadparwaiz1/cmp_luasnip'},
    {'hrsh7th/cmp-nvim-lua'},
    -- Snippets
    {'L3MON4D3/LuaSnip'},
    {'rafamadriz/friendly-snippets'},
  },
  config = function()
    local null_ls = require("null-ls")
    local icons = require("config/symbols").lsp
    local lsp = require('lsp-zero').preset({
      name = 'recommended',
      sign_icons = {
        error = icons.Error,
        warn = icons.Warn,
        hint = icons.Hint,
        info = icons.Info
      }
    })

    lsp.nvim_workspace()
    lsp.setup()
    local null_opts = lsp.build_options('null-ls', {})

    null_ls.setup({
      on_attach = function(client, bufnr)
        null_opts.on_attach(client, bufnr)
      end,
      sources = {
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.diagnostics.fish,
        null_ls.builtins.diagnostics.rubocop,
        null_ls.builtins.diagnostics.selene,
        null_ls.builtins.diagnostics.shellcheck,
        null_ls.builtins.diagnostics.tidy,
        null_ls.builtins.formatting.eslint_d,
        null_ls.builtins.formatting.fish_indent,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.tidy,
      },
    })
  end,
}
