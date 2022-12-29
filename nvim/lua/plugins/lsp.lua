return {
  { 'williamboman/mason.nvim', config = true },
  { 'williamboman/mason-lspconfig.nvim', config = { automatic_installation = true } },
  { 'hrsh7th/nvim-cmp' },
  { 'neovim/nvim-lspconfig',
    config = function()
      require("lspconfig").gopls.setup{}
    end
  },
  { 'jose-elias-alvarez/null-ls.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      local null_ls = require("null-ls")
      local sources = {
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.formatting.eslint,
        null_ls.builtins.diagnostics.fish,
        null_ls.builtins.formatting.fish_indent,
        null_ls.builtins.diagnostics.luacheck,
        null_ls.builtins.diagnostics.rubocop,
        null_ls.builtins.diagnostics.shellcheck,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.prettier,
      }
      local diagnostic_config = {
        virtual_text = false,
        float = {
          focus = false,
          focusable = false,
          border = 'rounded'
        }
      }

      null_ls.setup({
        sources = sources,
        diagnostic_config = diagnostic_config
      })

      vim.fn.sign_define(
        "DiagnosticSignError",
        { texthl = "DiagnosticSignError", text = "✖", numhl = "DiagnosticSignError" }
      )
      vim.fn.sign_define(
        "DiagnosticSignWarn",
        { texthl = "DiagnosticSignWarn", text = "▲", numhl = "DiagnosticSignWarn" }
      )
      vim.fn.sign_define(
        "DiagnosticSignHint",
        { texthl = "DiaanosticSignHint", text = "⚑", numhl = "DiaanosticSignHint" }
      )
      vim.fn.sign_define(
        "DiagnosticSignInfo",
        { texthl = "DiaanosticSignInfo", text = "ⓘ", numhl = "DiaanosticSignInfo" }
      )

      vim.diagnostic.config(diagnostic_config)

      vim.api.nvim_create_autocmd("CursorHold", {
        pattern = "*",
        callback = function ()
          vim.diagnostic.open_float()
        end
      })
    end
  },
}
