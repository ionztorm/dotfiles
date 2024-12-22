-- Bootstrap lazy.nvim
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
			"catppuccin/nvim",
			name = "catppuccin",
			priority = 1000,
			config = function()
				require("catppuccin").setup({
					flavour = "mocha",
					transparent_background = true,
					integrations = {
						neotree = true,
						-- gitsigns = true,
						-- harpoon = true,
						blink_cmp = true,
						fzf = true,
						mason = true,
						markdown = true,
						mini = {
							enabled = true,
							indentscope_color = "lavender",
						},
						native_lsp = {
							enabled = true,
							virtual_text = {
								errors = { "italic" },
								hints = { "italic" },
								warnings = { "italic" },
								information = { "italic" },
								ok = { "italic" },
							},
							underlines = {
								errors = { "underline" },
								hints = { "underline" },
								warnings = { "underline" },
								information = { "underline" },
								ok = { "underline" },
							},
							inlay_hints = {
								background = true,
							},
						},
						lsp_trouble = true,
						treesitter = true,
						treesitter_context = true,
					},
				})
				vim.cmd.colorscheme("catppuccin")
			end,
		},
		{ import = "plugins" },
	},
	change_detection = {
		enabled = true,
		notify = false,
	},
})
