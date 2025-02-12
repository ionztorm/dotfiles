return function()
	sennvim.lsp.add_config("cssls", {})
	sennvim.formatters.add_formatter("css", { "prettier" })
end
