return {
	"OXY2DEV/markview.nvim",
	lazy = false,

	-- For `nvim-treesitter` users.
	priority = 49,

	dependencies = {
		"saghen/blink.cmp",
	},

	config = function()
		local config = require("markview.spec").config
		config.preview.icon_provider = "devicons"
		vim.keymap.set("n", "<leader>md", ":Markview<CR>")
	end,
}
