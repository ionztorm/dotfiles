local M = {}

M.utilities = require("config.utils.utilities")
M.lsp = require("config.utils.lsploader")
M.formatters = require("config.utils.formatterloader")
M.linters = require("config.utils.linterloader")

return M
