return {
	"saghen/blink.cmp",
	event = { "LspAttach" },
	dependencies = "rafamadriz/friendly-snippets",
	version = "v0.*",
	opts = {
		-- keymap = {
		-- 	["<S-Enter>"] = { "accept" },
		-- },
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		completion = {
			menu = { border = "rounded" },
			documentation = { window = { border = "rounded" }, auto_show = true, auto_show_delay_ms = 500 },
		},

		signature = { enabled = true, window = { border = "rounded" } },
	},
}
