return function()
	sennvim.lsp.add_config("html", {})
	sennvim.formatters.add_formatter("html", { "prettier" })
end
