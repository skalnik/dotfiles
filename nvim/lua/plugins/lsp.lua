return {
	{ "neovim/nvim-lspconfig" },
	{ "mason-org/mason.nvim",           opts = {} },
	{ "mason-org/mason-lspconfig.nvim", opts = {} },
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
		},
		event = "VeryLazy",
		opts = {
			ensure_installed = {
				"bashls", "cssls", "eslint", "gopls", "html", "lua_ls", "ruff",
			},
		},
	},
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
		lazy = false,
		version = "1.*",
		opts = {
			keymap = { preset = "default" },
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
}
