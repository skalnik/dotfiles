return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    lazy = true,
    config = function()
      require('lsp-zero.settings').preset({ name = 'recommended' })
    end
  },

  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      {'L3MON4D3/LuaSnip'},
    },
    config = function()
      require('lsp-zero.cmp').extend()

      local cmp = require('cmp')
      local cmp_action = require('lsp-zero.cmp').action()

      cmp.setup({
        mapping = {
          ['<S-Space>'] = cmp.mapping.complete(),
          ['<Right>'] = cmp.mapping.confirm({select = true}),
          ['<S-Right>'] = cmp_action.luasnip_jump_forward(),
          ['<S-Left>'] = cmp_action.luasnip_jump_backward(),
        }
      })
    end
  },

  {
    'neovim/nvim-lspconfig',
    cmd = 'LspInfo',
    event = {'BufReadPre', 'BufNewFile'},
    dependencies = {
      {'hrsh7th/cmp-nvim-lsp'},
      {'williamboman/mason-lspconfig.nvim'},
      {
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'jose-elias-alvarez/null-ls.nvim', dependencies = { "nvim-lua/plenary.nvim" } },
    },
    config = function()
      local lsp = require('lsp-zero')

      lsp.on_attach(function(_, bufnr)
        lsp.default_keymaps({buffer = bufnr})
      end)

      local icons = require("config/symbols").lsp
      lsp.set_sign_icons({
        error = icons.Error,
        warn = icons.Warn,
        hint = icons.Hint,
        info = icons.Info
      })

      require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

      lsp.setup()

      local null_ls = require("null-ls")
      null_ls.setup({
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
    end
  }
}
