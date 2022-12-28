local autocmd = vim.api.nvim_create_autocmd

autocmd('FileType', {
  pattern = "go",
  command = "setlocal noexpandtab"
})
