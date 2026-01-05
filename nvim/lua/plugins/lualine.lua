return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "arkav/lualine-lsp-progress" },
	event = "VeryLazy",
	config = function()
		local filename_section = {
			"filename",
			file_status = true,
			newfile_status = false,
			path = 1,
			shorting_target = 40,
			symbols = {
				modified = " []",
				readonly = " []",
				unnamed = "[No Name]",
				newfile = "[]",
			},
		}
		local symbols = require("config/symbols").lsp
		local diagnostics = {
			"diagnostics",
			sources = { "nvim_lsp", "nvim_diagnostic", "vim_lsp" },
			sections = { "error", "warn", "info", "hint" },
			symbols = {
				error = symbols.Error .. " ",
				warn = symbols.Warn .. " ",
				hint = symbols.Hint .. " ",
				info = symbols.Info .. " ",
			},
			colored = true,
			always_visible = false,
		}

		local diff = {
			"diff",
			colored = false,
			symbols = {
				added = " ",
				modified = " ",
				removed = " ",
			},
		}

		local lsp_status = {
			"lsp_status",
			icon = "󰚩",
			symbols = {
				spinner = { "🌑 ", "🌒 ", "🌓 ", "🌔 ", "🌕 ", "🌖 ", "🌗 ", "🌘 " },
				done = "",
			},
			show_name = true,
		}

		require("lualine").setup({
			options = {
				icons_enabled = true,
				section_separators = { left = "", right = "" },
				component_separators = { left = "│", right = "│" },
				extensions = { "quickfix" },
				globalstatus = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { diff, diagnostics },
				lualine_c = { filename_section },
				lualine_x = { lsp_status, "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { filename_section },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
		})

		vim.opt.showmode = false
	end,
}
