return {
	"barrett-ruth/live-server.nvim",
	bulid = "npm add -g live-server",
	cmd = { "LiveServerStart", "LiveServerStop" },
	config = function()
		require("live-server").setup({})
	end,
}
