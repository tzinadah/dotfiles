return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Set header

		dashboard.section.header.val = {
			[[ ┌───────────────────────────────────────────────────────────────────────┐ ]],
			[[ │                                ,_     _                               │ ]],
			[[ │                                |\\_,-~/                               │ ]],
			[[ │                                / _  _ |    ,--.                       │ ]],
			[[ │                               (  @  @ )   / ,-'                       │ ]],
			[[ │                                \  _T_/-._( (                          │ ]],
			[[ │                                /         `. \                         │ ]],
			[[ │                               |         _  \ |                        │ ]],
			[[ │                                \ \ ,  /      |                        │ ]],
			[[ │                                 || |-_\__   /                         │ ]],
			[[ │                                ((_/`(____,-'                          │ ]],
			[[ └───────────────────────────────────────────────────────────────────────┘ ]],
			[[                                   NEOVIM                                  ]],
		}
		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("e", "   New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("f", "󰈞   Find file", ":Telescope find_files <CR>"),
			dashboard.button("x", "   Explore", ":Oil <CR>"),
			dashboard.button("s", "   Settings", ":edit ~/dotfiles/<CR>"),
			dashboard.button("q", "󰩈   Quit Neovim", ":qa<CR>"),
		}

		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer
		vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])
	end,
}
