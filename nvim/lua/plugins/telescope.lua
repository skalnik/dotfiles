return {
  {
    'cwebster2/github-coauthors.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    config = function()
      require('telescope').load_extension('githubcoauthors')
    end
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
    build = 'make',
    config = function()
      require("telescope").load_extension("fzf")
    end
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope-fzf-native.nvim",
      "cwebster2/github-coauthors.nvim",
    },
    config = function()
      local telescope = require('telescope')
      local actions = require("telescope.actions")
      telescope.setup{
        defaults = {
          borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
          prompt_prefix = "🔍️ ",
          mappings = {
            -- Esc to close while in insert mode
            i = {
              ["<esc>"] = actions.close
            },
          },
        }
      }

      telescope.load_extension('githubcoauthors')

      -- Disable copilot in Telescope
      vim.g.copilot_filetypes = vim.g.copilot_filetypes or {}
      vim.g.copilot_filetypes["TelescopeResults"] = false

      local map = vim.api.nvim_set_keymap
      map("n", "<Leader>t", "<CMD>Telescope find_files<CR>", { noremap = true })
      map("n", "<Leader>b", "<CMD>Telescope buffers<CR>", { noremap = true })
      map("n", "<Leader>c", "<CMD>lua require('telescope').extensions.githubcoauthors.coauthors()<CR>", { noremap = true })
    end,

    keys = {
      { "<leader>t", "<CMD>Telescope find_files<CR>" },
      { "<leader>b", "<CMD>Telescope buffers<CR>" },
      { "<leader>c", "<CMD>lua require('telescope').extensions.githubcoauthors.coauthors()<CR>" },
    }
  }
}
