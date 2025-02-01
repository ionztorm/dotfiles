return function()
	sennvim.lsp.add_config("basedpyright", {
		settings = {
			basedpyright = {
				typeCheckingMode = "basic",
				autoImportCompletions = true,
				disableOrganizeImports = true,
			},
		},
	})
	sennvim.lsp.add_config("ruff", {
		init_options = {
			settings = {
				configuration = "~/.config/ruff/ruff.toml",
			},
		},
	})
	-- sennvim.linters.add_linter("python", { "ruff" })
	-- sennvim.formatters.add_formatter("python", { "ruff" })
	-- sennvim.formatters.add_formatter_config("ruff", {
	-- 	command = "ruff",
	-- 	args = { "--fix", "--stdin-filename", "%:p", "-" },
	-- 	stdin = true,
	-- })
end
