-- ===========================================
-- Shortcuts for Vim API
-- ===========================================
local g = vim.g -- Shorten vim.g to g
local opt = vim.opt -- Shorten vim.opt to opt
local cmd = vim.cmd -- Shorten vim.cmd to cmd

-- ===========================================
-- Leader Key Settings
-- ===========================================
g.mapleader = " " -- Set space as the leader key
g.maplocalleader = "\\" -- Set backslash as the local leader key

-- ===========================================
-- Encoding Settings
-- ===========================================
vim.scriptencoding = "utf-8" -- Script encoding
opt.encoding = "utf-8" -- Editor encoding
opt.fileencoding = "utf-8" -- File encoding

-- ===========================================
-- UI Settings
-- ===========================================
opt.title = true -- Set terminal title
opt.termguicolors = true
opt.showcmd = true -- Show command in the bottom bar
opt.cmdheight = 0 -- Command line height
opt.laststatus = 0 -- Hide status bar
opt.number = true -- Enable line numbers
opt.relativenumber = true -- Relative line numbers
opt.cursorline = true -- Highlight the current line
opt.fillchars = { eob = " " } -- Hide tildes on empty lines
opt.splitright = true -- Vertical splits open to the right
opt.splitbelow = true -- Horizontal splits open below
opt.splitkeep = "cursor" -- Keep cursor centered during splits
opt.hlsearch = true -- Highlight search matches
opt.wrap = false -- Disable line wrapping

-- ===========================================
-- Indentation Settings
-- ===========================================
opt.expandtab = true -- Convert tabs to spaces
opt.smarttab = true -- Smart tab behavior
opt.shiftwidth = 2 -- Indent by 2 spaces
opt.tabstop = 2 -- Tab width is 2 spaces
opt.autoindent = true -- Auto-indent new lines
opt.smartindent = true -- Smart indent based on code structure
opt.breakindent = true -- Preserve indent in wrapped lines

-- ===========================================
-- Search Settings
-- ===========================================
opt.ignorecase = true -- Case insensitive search
opt.inccommand = "split" -- Show search/replace preview in a split
opt.path:append({ "**" }) -- Enable recursive search into subdirectories
opt.wildignore:append({ "*/node_modules/*" }) -- Ignore node_modules in search

-- ===========================================
-- File Management Settings
-- ===========================================
opt.backup = false -- Disable backup file creation
opt.fileencoding = "utf-8" -- Set file encoding to utf-8

-- ===========================================
-- Scrolling and Cursor Settings
-- ===========================================
-- opt.scrolloff = 10 -- Keep 10 lines visible when scrolling
opt.sidescrolloff = 5 -- Keep 5 columns visible when scrolling horizontally

-- ===========================================
-- Behavior Settings
-- ===========================================
opt.backspace = { "start", "eol", "indent" } -- Backspace behavior
opt.formatoptions:append({ "r" }) -- Continue comments with new line

-- ===========================================
-- Performance Settings
-- ===========================================
opt.updatetime = 300 -- Faster completion time (default 4000ms)

-- ===========================================
-- Syntax and Highlighting
-- ===========================================
cmd("syntax on") -- Enable syntax highlighting

-- ===========================================
-- Matching Settings
-- ===========================================
opt.showmatch = true -- Highlight matching parentheses
