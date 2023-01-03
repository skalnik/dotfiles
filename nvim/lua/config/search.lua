local set = vim.opt
local autocmd = vim.api.nvim_create_autocmd
local map = vim.api.nvim_set_keymap

if vim.fn.executable("rg") then
  set.grepprg = "rg\\ --vimgrep"
end

set.ignorecase = true -- Ignore case when searching
set.smartcase = true -- Ignore case if all lower, otherwise pay attention
set.incsearch = true -- Incremental search
set.hlsearch = true -- Highlight search results permanently

-- Enter clears highlight, but works regularly elsewhere
map("n", "<CR>", "<CMD>nohlsearch<CR>", { noremap = true })
local enter_esc = vim.api.nvim_create_augroup("enter_esc", { clear = true })
autocmd("BufReadPost", {
  pattern = "quickfix",
  command = "nnoremap <buffer> <CR> <CR>",
  group = enter_esc,
})
autocmd("CmdWinEnter", {
  pattern = "*",
  command = "nnoremap <buffer> <CR> <CR>",
  group = enter_esc,
})

-- Only highlight when not in insert mode
autocmd("InsertEnter", {
  pattern = "*",
  callback = function()
    vim.opt_local.hlsearch = false
  end,
})

autocmd("InsertLeave", {
  pattern = "*",
  callback = function()
    vim.opt_local.hlsearch = true
  end,
})
