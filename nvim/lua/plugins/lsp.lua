return {
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      { "williamboman/mason.nvim", config = true },
      { "folke/neodev.nvim", config = true },
      { "williamboman/mason-lspconfig.nvim", config = true },
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local lspconfig = require("lspconfig")

      for name, icon in pairs(require("config/symbols").lsp) do
        name = "DiagnosticSign" .. name
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = name })
      end

      vim.diagnostic.config({
        virtual_text = false,
        float = {
          focus = false,
          focusable = false,
          border = "single",
        },
      })

      vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, {})
      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
      local opts = { capabilities = capabilities }

      lspconfig.gopls.setup(opts)
      lspconfig.sorbet.setup(opts)
      lspconfig.sumneko_lua.setup({
        capabilities = opts.capabilities,
        Lua = {
          completion = {
            callSnippet = "Replace",
          },
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            -- library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          },
        },
      })

      vim.api.nvim_create_autocmd("CursorHold", {
        pattern = "*",
        callback = function()
          vim.diagnostic.open_float()
        end,
      })
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local null_ls = require("null-ls")

      require("null-ls").setup({
        sources = {
          null_ls.builtins.diagnostics.eslint,
          null_ls.builtins.diagnostics.fish,
          null_ls.builtins.diagnostics.rubocop,
          null_ls.builtins.diagnostics.selene,
          null_ls.builtins.diagnostics.shellcheck,
          null_ls.builtins.diagnostics.tidy,
          null_ls.builtins.formatting.eslint,
          null_ls.builtins.formatting.fish_indent,
          null_ls.builtins.formatting.gofmt,
          null_ls.builtins.formatting.goimports,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.tidy,
        },
      })
    end,
  },
}
