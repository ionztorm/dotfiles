local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{
			"folke/tokyonight.nvim",
			lazy = false,
			priority = 1000,
			config = function()
				require("tokyonight").setup({
					style = "storm",
					transparent = true,
					terminal_colors = true,
					styles = {
						floats = "transparent",
						sidebars = "transparent",
						comments = { italic = false },
						keywords = { italic = false },
						variables = { bold = true },
					},
					dim_inactive = true,
				})
				vim.cmd.colorscheme("tokyonight")
			end,
		},

		{ import = "plugins" },
	},
	checker = { enabled = true, notify = false },
	change_detection = {
		enabled = true,
		notify = false,
	},
})
