return {
	{ "tpope/vim-endwise", event = "BufReadPost" },
	{ "tpope/vim-fugitive" },
	{ "tpope/vim-rhubarb" },

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
	{ "tversteeg/registers.nvim", config = true, keys = { '"', { "<C-r>", mode = "i" } } },
	{ "kyazdani42/nvim-web-devicons", config = true },
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		lazy = false,
		config = function()
			require("nvim-treesitter").install({
				"lua", "vim", "vimdoc", "query", "regex",
				"go", "gomod", "gosum", "gowork",
				"javascript", "typescript", "tsx",
				"html", "css", "json", "yaml", "toml",
				"bash", "fish", "markdown", "markdown_inline",
				"ruby", "python",
				"gitcommit", "git_rebase", "gitignore", "diff",
			})
			vim.api.nvim_create_autocmd("FileType", {
				callback = function(ev)
					if pcall(vim.treesitter.start, ev.buf) then
						vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end
				end,
			})
		end,
	},
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
