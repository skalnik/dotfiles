return {
  "skalnik/vim-emoji",
  config = function()
    local autocmd = vim.api.nvim_create_autocmd
    autocmd('BufRead', {
      pattern = "**/MERGE_MSG",
      command = "%s/Merge branch/\\=emoji#for('part_alternation_mark').'erge branch'/eg"
    })
  end
}
