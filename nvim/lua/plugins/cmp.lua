return {
	"saghen/blink.cmp",
	event = { "LspAttach" },
	dependencies = { "giuxtaposition/blink-cmp-copilot", "rafamadriz/friendly-snippets" },
	version = "v0.*",
	opts = {
		sources = {
			default = { "copilot", "lsp", "path", "snippets", "buffer", "markdown" },
			cmdline = function()
				local type = vim.fn.getcmdtype()
				-- Search forward and backward
				if type == "/" or type == "?" then
					return { "buffer" }
				end
				-- Commands
				if type == ":" then
					return { "cmdline" }
				end
				return {}
			end,
			providers = {
				lsp = {
					min_keyword_length = 2,
					score_offset = 0,
				},
				path = {
					min_keyword_length = 0,
				},
				snippets = {
					min_keyword_length = 2,
				},
				buffer = {
					min_keyword_length = 4,
					max_items = 5,
				},

				copilot = {
					name = "copilot",
					module = "blink-cmp-copilot",
					score_offset = 100,
					async = true,
					transform_items = function(_, items)
						local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
						local kind_idx = #CompletionItemKind + 1
						CompletionItemKind[kind_idx] = "Copilot"
						for _, item in ipairs(items) do
							item.kind = kind_idx
						end
						return items
					end,
				},
				markdown = {
					name = "RenderMarkdown",
					module = "render-markdown.integ.blink",
					fallbacks = { "lsp" },
				},
			},
		},
		keymap = {
			-- preset = "enter",
			["<C-y"] = { "select_and_accept" },
			-- ["<S-Enter>"] = { "accept" },
			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			["<Tab>"] = {
				function(cmp)
					return cmp.select_next()
				end,
				"snippet_forward",
				"fallback",
			},
			["<S-Tab>"] = {
				function(cmp)
					return cmp.select_prev()
				end,
				"snippet_backward",
				"fallback",
			},
		},
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
			kind_icons = {
				Copilot = "",
				Text = "󰉿",
				Method = "󰊕",
				Function = "󰊕",
				Constructor = "󰒓",

				Field = "󰜢",
				Variable = "󰆦",
				Property = "󰖷",

				Class = "󱡠",
				Interface = "󱡠",
				Struct = "󱡠",
				Module = "󰅩",

				Unit = "󰪚",
				Value = "󰦨",
				Enum = "󰦨",
				EnumMember = "󰦨",

				Keyword = "󰻾",
				Constant = "󰏿",

				Snippet = "󱄽",
				Color = "󰏘",
				File = "󰈔",
				Reference = "󰬲",
				Folder = "󰉋",
				Event = "󱐋",
				Operator = "󰪚",
				TypeParameter = "󰬛",
			},
		},
		completion = {
			menu = { border = "rounded" },
			documentation = { window = { border = "rounded" }, auto_show = true, auto_show_delay_ms = 500 },
			list = { selection = "auto_insert" },
			ghost_text = { enabled = true },
		},

		signature = { enabled = true, window = { border = "rounded" } },
	},
}