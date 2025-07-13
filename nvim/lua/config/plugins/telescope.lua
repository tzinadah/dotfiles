return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"BurntSushi/ripgrep",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		require("telescope").setup({
			pickers = {
				find_files = { theme = "dropdown", hidden = true, file_ignore_patterns = { "node_modules/", ".git/" } },
				live_grep = { theme = "dropdown", hidden = true, file_ignore_patterns = { "node_modules/", ".git/" } },
				help_tags = { theme = "ivy", hidden = true, file_ignore_patterns = { "node_modules/", ".git/" } },
			},
			extensions = {
				fzf = {},
			},
		})

		require("telescope").load_extension("fzf")
		-- Keybinds
		vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files)
		vim.keymap.set("n", "<leader>lg", require("telescope.builtin").live_grep)
		vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags)
	end,
}
