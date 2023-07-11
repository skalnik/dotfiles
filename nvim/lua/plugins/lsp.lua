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
      {
        "zbirenbaum/copilot-cmp",
        dependencies = {
          "zbirenbaum/copilot.lua",
          cmd = "Copilot",
          event = "InsertEnter",
          config = function()
            require("copilot").setup({
              suggestion = { enabled = false },
              panel = { enabled = false },
            })
          end,
        },
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },
    config = function()
      require('lsp-zero.cmp').extend()

      local cmp = require('cmp')
      local cmp_action = require('lsp-zero.cmp').action()

      cmp.setup({
        mapping = {
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-y>"] = cmp_action.toggle_completion(),
          ['<S-Right>'] = cmp_action.luasnip_jump_forward(),
          ['<S-Left>'] = cmp_action.luasnip_jump_backward(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        },
        sources = cmp.config.sources({
          { name = "copilot" },
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
          { name = "emoji" },
        }),
        sorting = {
          priority_weight = 2,
          comparators = {
            -- Give Copilot priority and then use the default comparators
            require("copilot_cmp.comparators").prioritize,

            cmp.config.compare.offset,
            cmp.config.compare.exact,
            -- cmp.config.compare.scopes,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            cmp.config.compare.locality,
            cmp.config.compare.kind,
            -- cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
        },
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
    end,

    keys = {
      { "<leader>gq", "<CMD>lua vim.lsp.buf.format()<CR>", { noremap = true } },
    }
  }
}
