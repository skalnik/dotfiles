return {
	settings = {
		pylsp = {
			plugins = {
				-- Defer to Ruff for style/lint
				pycodestyle = { enabled = false },
			},
		},
	},
}
