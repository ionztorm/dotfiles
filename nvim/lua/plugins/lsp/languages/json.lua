return function()
	sennvim.lsp.add_config("jsonls", {})
	sennvim.formatters.add_formatter("json", { "prettier" })
end
