return function()
	sennvim.lsp.add_config("pyright", {})
	sennvim.linters.add_linter("python", { "ruff" })
	sennvim.formatters.add_formatter("python", { "ruff" })
end
