vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })

vim.api.nvim_create_user_command("FormatDisable", function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = "Disable autoformat-on-save",
  bang = true,
})

vim.api.nvim_create_user_command("FormatEnable", function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = "Re-enable autoformat-on-save",
})


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
      require('mason-tool-installer').setup({
        ensure_installed = {
          "gopls",
          "lua_ls",
        }
      })
    end
  },
  {
    'stevearc/conform.nvim',
    event = { "BufWritePre" },
    -- This will provide type hinting with LuaLS
    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
      formatters_by_ft = {
        python = { "ruff_fix", "ruff_format" },
        go = { "gofmt" },
      },
      default_format_opts = {
        lsp_format = "fallback",
      },
      format_on_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { timeout_ms = 500, lsp_format = "fallback" }
      end
    }
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
