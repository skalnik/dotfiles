call plug#begin(stdpath('data') . '/plugged')

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'nvim-lualine/lualine.nvim'

call plug#end()

let mapleader = ","

runtime! config/**/*
