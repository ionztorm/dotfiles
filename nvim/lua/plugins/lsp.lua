return {
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"Saghen/blink.cmp",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			local mason = require("mason")
			local mason_lspconfig = require("mason-lspconfig")
			local mason_tool_installer = require("mason-tool-installer")
			local lspconfig = require("lspconfig")
			local blink_cmp = require("blink.cmp")

			sennvim.lsp.load_language_configs()

			local servers = sennvim.lsp.get_server_names()
			local formatters = sennvim.formatters.get_formatter_names()
			local linters = sennvim.linters.get_linter_names()
			local lsp_configs = sennvim.lsp.configs
			local ensure_installed = sennvim.utilities.combine_tables(servers, formatters, linters)

			local capabilities = blink_cmp.get_lsp_capabilities()
			local keymaps = require("core.keymaps").lsp
			local on_attach = function(_, bufnr)
				keymaps(bufnr)
			end

			mason.setup({
				ui = {
					border = "rounded",
				},
			})

			mason_lspconfig.setup({ ensure_installed = servers })

			mason_tool_installer.setup({
				auto_update = true,
				run_on_start = true,
				start_delay = 3000,
				debounce_hours = 12,
				ensure_installed = ensure_installed,
			})

			for server, config in pairs(lsp_configs) do
				config.on_attach = on_attach
				config.capabilities = vim.tbl_deep_extend("force", capabilities, config.capabilities or {})
				lspconfig[server].setup({
					autostart = config.autostart,
					cmd = config.cmd,
					capabilities = capabilities,
					filetypes = config.filetypes,
					on_attach = on_attach,
					settings = config.settings,
					root_dir = config.root_dir,
				})
			end
		end,
	},
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConfosmInfo" },
		opts = {
			notify_on_error = false,
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
			default_format_opts = {
				async = true,
				timeout_ms = 500,
				lsp_format = "fallback",
			},
			formatters = sennvim.formatters.get_formatter_configs(),
			formatters_by_ft = sennvim.formatters.formatters,
		},
	},
	{
		"mfussenegger/nvim-lint",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				sennvim.linters.linters,
			}

			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})

			vim.keymap.set("n", "<leader>l", function()
				lint.try_lint()
			end, { desc = "Trigger linting for current file" })
		end,
	},
}
