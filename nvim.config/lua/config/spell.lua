local autocmd = vim.api.nvim_create_autocmd
autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.md",
	callback = function()
		vim.opt_local.spell = true
	end,
})
autocmd("FileType", {
	pattern = "gitcommit",
	callback = function()
		vim.opt_local.spell = true
	end,
})
autocmd("FileType", {
	pattern = "jjdescription",
	callback = function()
		vim.opt_local.spell = true
	end,
})
