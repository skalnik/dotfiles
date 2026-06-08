return {
	-- Ruff only lints/formats; suppress hover so it doesn't shadow other LSPs
	capabilities = { hoverProvider = false },
}
