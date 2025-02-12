return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	---@module 'render-markdown'
	---@diagnostic disable-next-line: undefined-doc-name
	---@type render.md.UserConfig
	opts = {},
	config = function()
		require("render-markdown").setup({
			-- your configuration comes here
			log_level = "debug",
		})
	end,
}
