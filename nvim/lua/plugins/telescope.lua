return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim" },
	config = function()
		-- Configuration for Telescope can go here
		require("telescope").setup({
			defaults = {
				file_ignore_patterns = {
					"node_modules",
				},
			},
			["ui-select"] = {
				require("telescope.themes").get_dropdown({}),
			},
		})
	end,
}
