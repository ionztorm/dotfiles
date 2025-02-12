return function()
	sennvim.lsp.add_config("biome", {})
	sennvim.formatters.add_formatter_config("biome", {
		prepend_args = {
			"check",
			"--unsafe",
			"--write",
		},
	})
end
