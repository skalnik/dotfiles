local telescope = require('telescope')
telescope.load_extension('fzf')

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

-- Disable copilot in Telescope
vim.g.copilot_filetypes = vim.g.copilot_filetypes or {}
vim.g.copilot_filetypes["TelescopeResults"] = false

vim.api.nvim_set_keymap("n", "<Leader>t", "<CMD>Telescope find_files<CR>", { noremap = true })
