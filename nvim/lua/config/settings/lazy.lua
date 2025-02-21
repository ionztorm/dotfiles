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
		-- {
		-- 	"rose-pine/neovim",
		-- 	name = "rose-pine",
		-- 	config = function()
		-- 		require("rose-pine").setup({
		-- 			vaiant = "main",
		-- 			styles = {
		-- 				italic = false,
		-- 				transparency = true,
		-- 			},
		-- 		})
		-- 		vim.cmd("colorscheme rose-pine")
		-- 	end,
		-- },
		{
			"vague2k/vague.nvim",
			config = function()
				-- NOTE: you do not need to call setup if you don't want to.
				require("vague").setup({
					transparent = true,
					style = {
						boolean = "none",
						number = "none",
						float = "none",
						error = "none",
						comments = "none",
						conditionals = "none",
						functions = "none",
						headings = "bold",
						operators = "none",
						strings = "none",
						variables = "none",

						-- keywords
						keywords = "none",
						keyword_return = "none",
						keywords_loop = "none",
						keywords_label = "none",
						keywords_exception = "none",

						-- builtin
						builtin_constants = "none",
						builtin_functions = "none",
						builtin_types = "none",
						builtin_variables = "none",
					},
					colors = {
						-- func = "#bc96b0",
						-- keyword = "#787bab",
						-- string = "#d4bd98",
						-- string = "#8a739a",
						-- string = "#f2e6ff",
						-- number = "#f2e6ff",
						-- string = "#d8d5b1",
						-- number = "#8f729e",
						-- type = "#dcaed7",
					},
				})
				vim.cmd.colorscheme("vague")
			end,
		},
		-- {
		-- 	"folke/tokyonight.nvim",
		-- 	lazy = false,
		-- 	priority = 1000,
		-- 	config = function()
		-- 		require("tokyonight").setup({
		-- 			style = "storm",
		-- 			transparent = true,
		-- 			terminal_colors = true,
		-- 			styles = {
		-- 				floats = "transparent",
		-- 				sidebars = "transparent",
		-- 				comments = { italic = false },
		-- 				keywords = { italic = false },
		-- 				variables = { bold = true },
		-- 			},
		-- 			dim_inactive = true,
		-- 		})
		-- 		vim.cmd.colorscheme("tokyonight")
		-- 	end,
		-- },
		-- {
		-- 	"catppuccin/nvim",
		-- 	name = "catppuccin",
		-- 	priority = 1000,
		-- 	config = function()
		-- 		require("catppuccin").setup({
		-- 			flavour = "mocha",
		-- 			transparent_background = true,
		-- 			integrations = {
		-- 				neotree = true,
		-- 				gitsigns = true,
		-- 				-- harpoon = true,
		-- 				blink_cmp = true,
		-- 				fzf = true,
		-- 				mason = true,
		-- 				markdown = true,
		-- 				mini = {
		-- 					enabled = true,
		-- 					indentscope_color = "lavender",
		-- 				},
		-- 				native_lsp = {
		-- 					enabled = true,
		-- 					virtual_text = {
		-- 						errors = { "italic" },
		-- 						hints = { "italic" },
		-- 						warnings = { "italic" },
		-- 						information = { "italic" },
		-- 						ok = { "italic" },
		-- 					},
		-- 					underlines = {
		-- 						errors = { "underline" },
		-- 						hints = { "underline" },
		-- 						warnings = { "underline" },
		-- 						information = { "underline" },
		-- 						ok = { "underline" },
		-- 					},
		-- 					inlay_hints = {
		-- 						background = true,
		-- 					},
		-- 				},
		-- 				lsp_trouble = true,
		-- 				treesitter = true,
		-- 				treesitter_context = true,
		-- 			},
		-- 		})
		-- 		vim.cmd.colorscheme("catppuccin")
		-- 	end,
		-- },

		{ import = "plugins" },
	},
	checker = { enabled = true, notify = false },
	change_detection = {
		enabled = true,
		notify = false,
	},
})
