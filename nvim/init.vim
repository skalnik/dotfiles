call plug#begin(stdpath('data') . '/plugged')

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-lualine/lualine.nvim'
Plug 'joshdick/onedark.vim'
Plug 'lukas-reineke/indent-blankline.nvim'

call plug#end()

let mapleader = ","

runtime! config/**/*
