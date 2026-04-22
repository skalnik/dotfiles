vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		local buf = ev.buf

		-- Keymaps not already provided by 0.11 defaults (grn/gra/gri/grr/gO/K/<C-S>)
		local map = function(lhs, rhs, desc)
			vim.keymap.set("n", lhs, rhs, { buffer = buf, desc = desc })
		end
		map("gd",         vim.lsp.buf.definition,     "Go to definition")
		map("gD",         vim.lsp.buf.declaration,    "Go to declaration")
		map("<leader>rn", vim.lsp.buf.rename,         "Rename symbol")
		map("<leader>ca", vim.lsp.buf.code_action,    "Code action")
		map("<leader>k",  vim.lsp.buf.signature_help, "Signature help")

		-- Document highlight on CursorHold
		if client and client:supports_method("textDocument/documentHighlight") then
			local group = vim.api.nvim_create_augroup("lsp_highlight_" .. buf, { clear = true })
			vim.api.nvim_create_autocmd("CursorHold",  { buffer = buf, group = group, callback = vim.lsp.buf.document_highlight })
			vim.api.nvim_create_autocmd("CursorMoved", { buffer = buf, group = group, callback = vim.lsp.buf.clear_references })
		end

		-- LSP folding (foldlevel=99 keeps all folds open by default; use zm/zc to close)
		if client and client:supports_method("textDocument/foldingRange") then
			vim.wo.foldmethod = "expr"
			vim.wo.foldexpr = "v:lua.vim.lsp.foldexpr()"
			vim.wo.foldlevel = 99
		end

		-- Inlay hints
		if client and client:supports_method("textDocument/inlayHint") then
			vim.lsp.inlay_hint.enable(true, { bufnr = buf })
			map("<leader>ih", function()
				vim.lsp.inlay_hint.enable(
					not vim.lsp.inlay_hint.is_enabled({ bufnr = buf }),
					{ bufnr = buf }
				)
			end, "Toggle inlay hints")
		end
	end,
})
