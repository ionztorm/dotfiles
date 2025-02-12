return function()
	sennvim.lsp.add_config("marksman", {})
	sennvim.linters.add_linter("markdown", { "markdownlint-cli2" })
	sennvim.formatters.add_formatter("markdown", { "markdown-toc" })
end
