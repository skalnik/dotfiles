-- Use built-in OSC 52 for copy only, avoiding clipboard-read prompts in Ghostty
local osc52 = require("vim.ui.clipboard.osc52")
vim.g.clipboard = {
	name = "osc52",
	copy = {
		["+"] = osc52.copy("+"),
		["*"] = osc52.copy("*"),
	},
	paste = {
		["+"] = function()
			return { vim.fn.split(vim.fn.getreg(""), "\n"), vim.fn.getregtype("") }
		end,
		["*"] = function()
			return { vim.fn.split(vim.fn.getreg(""), "\n"), vim.fn.getregtype("") }
		end,
	},
}
return {}
