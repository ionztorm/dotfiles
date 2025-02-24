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
				logLevel = "debug",
			},
		},
	})
end
