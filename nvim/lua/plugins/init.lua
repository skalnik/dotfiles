return {
	"editorconfig/editorconfig-vim",
	{ "tpope/vim-endwise", event = "BufReadPost" },
	"jparise/vim-graphql",
	{ "tpope/vim-fugitive" },
	{ "tpope/vim-rhubarb" },

	{ "dag/vim-fish", ft = "fish" },
	{ "kchmck/vim-coffee-script", ft = "coffeescript" },

	{
		"stevearc/oil.nvim",
		config = true,
		keys = {
			{
				"-",
				function()
					require("oil").open()
				end,
			},
		},
	},
	{ "vim-scripts/Align", cmd = "Align" },
	{ "tversteeg/registers.nvim", config = true, event = "BufEnter" },
	{ "kyazdani42/nvim-web-devicons", config = true },
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", event = "BufReadPost" },
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
}
