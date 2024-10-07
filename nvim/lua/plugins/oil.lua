return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	config = function()
		require("oil").setup({
			float = {
				padding = 5,
				max_width = 90,
				max_height = 90,
				border = "rounded",
				win_options = {
					winblend = 0,
					winhl = "Normal:OilFloatBackground,FloatBorder:OilFloatBorder",
				},
				preview = {
					winblend = 0,
				},
				progress = {
					winblend = 0,
				},
			},
		})
	end,
}
