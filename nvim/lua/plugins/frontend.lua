return {
	-- tailwind colours
	{
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({
				user_default_options = {
					tailwind = true,
				},
			})
		end,
	},
	-- auto close html / jsx tags
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true,
					enable_rename = true,
					enablet_close_on_slash = false,
				},
			})
		end,
	},
	{
		"brianhuster/live-preview.nvim",
		dependencies = {
			-- You can choose one of the following pickers
			"ibhagwan/fzf-lua",
		},
		config = function()
			require("livepreview.config").set({})
		end,
	},
}
