require('settings')
require('config/search')
require('config/filetype')


require('bootstrap')
require('plugins')
require("lazy").setup("plugins")

vim.cmd('runtime! config/**/*')
