local map = vim.api.nvim_set_keymap

-- Jump btwn files with leader leader
map("n", "<leader><leader>", "<c-^>", { noremap = true })

-- Capital direction for start/end line
map("n", "H", "^", { noremap = true })
map("n", "L", "$", { noremap = true })

-- Add shortcuts to move around windows faster
map("n", "<C-h>", ":wincmd h<CR>", { silent = true })
map("n", "<C-j>", ":wincmd j<CR>", { silent = true })
map("n", "<C-k>", ":wincmd k<CR>", { silent = true })
map("n", "<C-l>", ":wincmd l<CR>", { silent = true })

-- Even out windows
map("", "<leader>=", "<C-w>=", {})
