local map = vim.keymap.set

-- Jump btwn files with leader leader
map("n", "<leader><leader>", "<c-^>")

-- Capital direction for start/end line
map("n", "H", "^")
map("n", "L", "$")

-- Add shortcuts to move around windows faster
map("n", "<C-h>", ":wincmd h<CR>", { silent = true })
map("n", "<C-j>", ":wincmd j<CR>", { silent = true })
map("n", "<C-k>", ":wincmd k<CR>", { silent = true })
map("n", "<C-l>", ":wincmd l<CR>", { silent = true })

-- Even out windows
map("", "<leader>=", "<C-w>=")
