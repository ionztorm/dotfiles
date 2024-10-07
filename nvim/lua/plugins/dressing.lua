return {
	"stevearc/dressing.nvim",
	opts = {},
	config = function()
		require("dressing").setup({
			select = {
				nui = {
					win_options = {
						winblend = 0,
					},
				},
			},
		})
	end,
}
