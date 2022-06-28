local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- Navigation
  use 'tpope/vim-vinegar'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Editing
  use 'vim-scripts/Align'
  use 'dense-analysis/ale'
  use 'editorconfig/editorconfig-vim'
  use 'github/copilot.vim'
  use 'ojroques/vim-oscyank'
  use 'tpope/vim-endwise'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'

  -- Filetype Specific
  use 'dag/vim-fish'
  use { 'fatih/vim-go', run = ':GoUpdateBinaries' }
  use 'godlygeek/tabular'
  use 'joker1007/vim-ruby-heredoc-syntax'
  use 'jparise/vim-graphql'
  use 'kchmck/vim-coffee-script'
  use 'plasticboy/vim-markdown'
  use 'sheerun/vim-polyglot'

  -- Looks
  use 'itchyny/lightline.vim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'navarasu/onedark.nvim'
  use 'skalnik/vim-emoji'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'junegunn/vim-peekaboo'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
