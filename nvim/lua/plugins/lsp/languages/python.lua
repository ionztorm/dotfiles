return function()
	sennvim.lsp.add_config("ruff", {})
	-- sennvim.formatters.add_formatter("python", { "black" })
	sennvim.formatters.add_formatter("python", { "ruff" })
	-- sennvim.formatters.add_formatter_config("black", {
	-- 	filetypes = { "python" },
	-- 	prepend_args = { "--fast" },
	-- 	args = { "--quiet" },
	-- 	stdin = true,
	-- })
	sennvim.linters.add_linter("python", { "ruff" })
end
