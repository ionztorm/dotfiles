return function()
	sennvim.lsp.add_config("ruff", {})
	sennvim.formatters.add_formatter("python", { "black" })
	sennvim.linters.add_linter("python", { "ruff" })
end
