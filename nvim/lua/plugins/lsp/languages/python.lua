return function()
	sennvim.lsp.add_config("pyright", {})
	sennvim.formatters.add_formatter("python", { "black" })
	sennvim.linters.add_linter("python", { "ruff" })
	-- sennvim.formatters.add_formatter("python", { "ruff" })
	-- sennvim.formatters.add_formatter_config("black", {
	-- 	filetypes = { "python" },
	-- 	prepend_args = { "--fast" },
	-- 	args = { "--quiet" },
	-- 	stdin = true,
	-- })
end
