local autocmd = vim.api.nvim_create_autocmd
autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.md",
	command = ":setlocal spell",
})
autocmd("FileType", {
	pattern = "gitcommit",
	command = ":setlocal spell",
})
autocmd("FileType", {
	pattern = "jjdescription",
	command = ":setlocal spell",
})
