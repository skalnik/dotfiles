local map = vim.keymap.set

-- Jump btwn files with leader leader
map("n", "<leader><leader>", "<c-^>", { desc = "Alternate file" })

-- Capital direction for start/end line
map("n", "H", "^", { desc = "Line start" })
map("n", "L", "$", { desc = "Line end" })

-- Add shortcuts to move around windows faster
map("n", "<C-h>", ":wincmd h<CR>", { silent = true, desc = "Window left" })
map("n", "<C-j>", ":wincmd j<CR>", { silent = true, desc = "Window down" })
map("n", "<C-k>", ":wincmd k<CR>", { silent = true, desc = "Window up" })
map("n", "<C-l>", ":wincmd l<CR>", { silent = true, desc = "Window right" })

-- Even out windows
map("", "<leader>=", "<C-w>=", { desc = "Equalize windows" })
