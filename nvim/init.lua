-- Config entry point

-- Lazy Neovim
require("config.lazy")

-- LSP
require("config.lsp")

-- Keybind
require("config.remappings")

-- Options
local set = vim.opt

-- tab options
set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4
set.expandtab = true

-- line numbers
set.number = true
set.relativenumber = true

-- system clipboard
set.clipboard = "unnamedplus"

-- line wrapping
set.wrap = false

-- sidebar
set.signcolumn = "yes"

-- mouse
set.mouse = "a"

-- error messages
vim.diagnostic.config({ virtual_text = false, virtual_lines = { current_line = true } })

-- comments on new line
vim.cmd("autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o")

-- Colorscheme
vim.cmd.colorscheme("nordfox")

-- Highlights
vim.api.nvim_set_hl(0, "Visual", { bg = "#94DBC5", fg = "#0F2E24", blend = 30 })
vim.api.nvim_set_hl(0, "Search", { bg = "#94DBC5", fg = "#0F2E24", blend = 30 })
vim.api.nvim_set_hl(0, "IncSearch", { bg = "#94DBC5", fg = "#0F2E24", blend = 30 })
