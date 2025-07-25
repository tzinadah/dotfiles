return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		vim.opt.termguicolors = true
		require("bufferline").setup({
			options = {
				mode = "tabs",
				diagnostics = "nvim_lsp",
				indicator = {
					style = "underline",
				},
				style_preset = { require("bufferline").style_preset.no_italic },
			},
		})
	end,
}
