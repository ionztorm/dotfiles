return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		input = {
			enabled = true,
		},
		dim = {
			enabled = true,
		},
		scroll = {
			enabled = true,
		},
		notifier = {
			enabled = true,
			timeout = 3000, -- default timeout in ms
		},
	},

	config = function(_, opts)
		require("snacks").setup(opts)
	end,
}
