vim.api.nvim_create_user_command("Format", function(args)
	local range = nil
	if args.count ~= -1 then
		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = { args.line1, 0 },
			["end"] = { args.line2, end_line:len() },
		}
	end
	require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })

vim.api.nvim_create_user_command("FormatDisable", function(args)
	if args.bang then
		-- FormatDisable! will disable formatting just for this buffer
		vim.b.disable_autoformat = true
	else
		vim.g.disable_autoformat = true
	end
end, {
	desc = "Disable autoformat-on-save",
	bang = true,
})

vim.api.nvim_create_user_command("FormatEnable", function()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
end, {
	desc = "Re-enable autoformat-on-save",
})

vim.api.nvim_create_user_command("FormatToggle", function()
	if vim.b.disable_autoformat or vim.g.disable_autoformat then
		vim.cmd.FormatEnable()
		vim.cmd.echomsg('"Autoformatting enabled ✅"')
	else
		vim.cmd.FormatDisable()
		vim.cmd.echomsg('"Autoformatting disabled ❌"')
	end
end, {
	desc = "Toggle autoformat-on-save",
})

vim.api.nvim_set_keymap("n", "<leader>a", ":FormatToggle<CR>", { silent = true })

return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		opts = {
			formatters_by_ft = {
				go = { "gofmt" },
				lua = { "stylua" },
				python = { "ruff_fix", "ruff_format" },
			},
			default_format_opts = {
				lsp_format = "fallback",
			},
			format_on_save = function(bufnr)
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				return { timeout_ms = 500, lsp_format = "fallback" }
			end,
		},
	},
}
