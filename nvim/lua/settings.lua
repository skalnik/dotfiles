----------------------
-- General settings --
----------------------
set = vim.opt
autocmd = vim.api.nvim_create_autocmd

-- Visuals
set.compatible = false     -- Make it modern
set.number = true          -- Show line numbers
set.showcmd = true         -- Display unfinished commands
set.showmatch = true       -- Show matching brackets
set.scrolloff = 10         -- Show 10 lines above/below cursor when near top/bottom of buffer
set.laststatus = 2         -- Always show status bar
set.relativenumber = true  -- Make line numbers relative
set.listchars['tab'] = '▸ '
set.listchars['trail'] = '·'
if vim.fn.has('termguicolors') == 1 then
  set.termguicolors = true -- Use 24 bit colors
end
vim.cmd('colorscheme onedark')

-- Search
set.ignorecase = true -- Ignore case when searching
set.smartcase = true  -- Ignore case if all lower, otherwise pay attention
set.incsearch = true  -- Incremental search
set.hlsearch = true   -- Highlight search results permanently

-- Editing
set.wrap = false       -- No line wrapping by default
set.linebreak = true   -- If we enable wrapping, do it at words rather than hard at character count
set.textwidth = 80     -- Set an 80 char text width for hard wrapping
set.smartindent = true -- Try to indent smartly
set.tabstop = 2        -- Show tabs as 2 spaces
set.shiftwidth = 2     -- A level of indentation is 2 spaces
set.softtabstop = 2    -- A soft (i.e. space based tab) is 2 spaces
set.expandtab = true   -- Use spaces instead of tabs normally

-- Small nicities
vim.g.mapleader = ','  -- use , for <Leader>
set.autoread = true    -- Automatically reload files if edited elsewhere
set.mouse = 'a'        -- Enable mouse in *a*ll modes
set.timeoutlen = 400   -- Timeout for commands

-- Make splits resize as we move around them
set.winheight = 5    -- Set height to 5, so we can make it the minimum
set.winminheight = 5 -- Set minimum height to 5
set.winheight = 999  -- Now set the height to 999, maxing it out to the screen height
set.winwidth = 80

-- Stop annoying me everytime I have a file open in two different vim sessions.
autocmd('SwapExists', {
  pattern = '*',
  command = "let v:swapchoice = 'e'"
})