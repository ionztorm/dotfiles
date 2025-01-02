return function()
	local inlay_hints = {
		includeInlayEnumMemberValueHints = true,
		includeInlayFunctionLikeReturnTypeHints = true,
		includeInlayFunctionParameterTypeHints = true,
		includeInlayParameterNameHints = "all",
		includeInlayParameterNameHintsWhenArgumentMatchesName = true,
		includeInlayPropertyDeclarationTypeHints = true,
		includeInlayVariableTypeHints = true,
		includeInlayVariableTypeHintsWhenTypeMatchesName = true,
	}

	local ts_settings = {
		settings = {
			maxTsServerMemory = 12288,
			typescript = {
				inlayHints = inlay_hints,
			},
			javascript = {
				inlayHints = inlay_hints,
			},
		},
	}

	sennvim.lsp.add_config("ts_ls", ts_settings)

	sennvim.formatters.add_formatter("typescript", { "biome" })
	sennvim.formatters.add_formatter("typescriptreact", { "biome" })
	sennvim.formatters.add_formatter("javascript", { "biome" })
	sennvim.formatters.add_formatter("javascriptreact", { "biome" })
	sennvim.formatters.add_formatter_config("biome", { prepend_args = { "check", "--unsafe", "--write" } })

	sennvim.linters.add_linter("typescript", { "biome", "eslint_d" })
	sennvim.linters.add_linter("javascrypt", { "biome", "eslint_d" })
	sennvim.linters.add_linter("typescriptreact", { "biome", "eslint_d" })
	sennvim.linters.add_linter("javacriptreact", { "biome", "eslint_d" })
end
