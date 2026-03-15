local set = vim.opt
local autocmd = vim.api.nvim_create_autocmd

if vim.fn.executable("rg") then
	set.grepprg = "rg --vimgrep"
end

set.ignorecase = true -- Ignore case when searching
set.smartcase = true -- Ignore case if all lower, otherwise pay attention
set.incsearch = true -- Incremental search
set.hlsearch = true -- Highlight search results permanently

-- Enter clears highlight, but works regularly elsewhere
vim.keymap.set("n", "<CR>", "<CMD>nohlsearch<CR>")
local enter_esc = vim.api.nvim_create_augroup("enter_esc", { clear = true })
autocmd("FileType", {
	pattern = "qf",
	callback = function()
		vim.keymap.set("n", "<CR>", "<CR>", { buffer = true })
	end,
	group = enter_esc,
})
autocmd("CmdWinEnter", {
	pattern = "*",
	callback = function()
		vim.keymap.set("n", "<CR>", "<CR>", { buffer = true })
	end,
	group = enter_esc,
})

-- Only highlight when not in insert mode
autocmd("InsertEnter", {
	pattern = "*",
	callback = function()
		vim.opt.hlsearch = false
	end,
})

autocmd("InsertLeave", {
	pattern = "*",
	callback = function()
		vim.opt.hlsearch = true
	end,
})
