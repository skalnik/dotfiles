return {
	settings = {
		gopls = {
			gofumpt = true,
			analyses = { unusedparams = true, shadow = true },
			staticcheck = true,
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
		},
	},
}
