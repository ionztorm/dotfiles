return {
	"brianhuster/live-preview.nvim",
	dependencies = {
		-- You can choose one of the following pickers
		"ibhagwan/fzf-lua",
	},
	config = function()
		require("livepreview.config").set({})
	end,
}
