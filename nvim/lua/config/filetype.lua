local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
  pattern = "go",
  command = ":setlocal noexpandtab",
})

autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.handlebars",
  command = ":setfiletype html",
})

autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.rabl",
  command = ":setfiletype ruby",
})

vim.g.ruby_heredoc_syntax_filetypes = {
  graphql = {
    start = "GRAPHQL",
  },
}
