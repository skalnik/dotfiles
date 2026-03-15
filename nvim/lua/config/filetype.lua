local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
	pattern = "go",
	callback = function()
		vim.opt_local.expandtab = false
	end,
})

autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.handlebars",
	callback = function()
		vim.bo.filetype = "html"
	end,
})

autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.rabl",
	callback = function()
		vim.bo.filetype = "ruby"
	end,
})

vim.g.ruby_heredoc_syntax_filetypes = {
	graphql = {
		start = "GRAPHQL",
	},
}
