----------------------
-- General settings --
----------------------

-- Visuals
vim.opt.compatible = false      -- Make it modern
vim.opt.number = true           -- Show line numbers
vim.opt.showcmd = true          -- Display unfinished commands
vim.opt.showmatch = true        -- Show matching brackets
vim.opt.scrolloff = 10          -- Show 10 lines above/below cursor when near top/bottom of buffer
vim.opt.laststatus = 2          -- Always show status bar
vim.opt.termguicolors = true    -- Use 24 bit colors
vim.cmd('colorscheme onedark')

-- Small nicities
vim.g.mapleader = ','    -- use , for <Leader>
vim.opt.autoread = true  -- Automatically reload files if edited elsewhere
vim.opt.mouse = a        -- Enable mouse in *a*ll modes
vim.opt.wrap = false     -- No line wrapping by default
vim.opt.linebreak = true -- If we enable wrapping, do it at words rather than hard at character count
vim.opt.textwidth = 80   -- Set an 80 char text width for hard wrapping

-- Make splits resize as we move around them
vim.opt.winheight = 5    -- Set height to 5, so we can make it the minimum
vim.opt.winminheight = 5 -- Set minimum height to 5
vim.opt.winheight = 999  -- Now set the height to 999, maxing it out to the screen height
vim.opt.winwidth = 80

autocmd = vim.api.nvim_create_autocmd

-- Make line numbers relative only in current buffer
autocmd('BufEnter', {
  pattern = '*',
  command = 'setlocal relativenumber'
})

autocmd('BufLeave', {
  pattern = '*',
  command = 'setlocal norelativenumber'
})

-- Stop annoying me everytime I have a file open in two different vim sessions.
autocmd('SwapExists', {
  pattern = '*',
  command = "let v:swapchoice = 'e'"
})
