return {
	"lewis6991/gitsigns.nvim",
	event = "BufReadPre",
	config = function()
		require("gitsigns").setup({
			signcolumn = true,
			current_line_blame = true,
		})
	end,
}
