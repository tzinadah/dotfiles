return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"markdown",
				"markdown_inline",
				"go",
				"html",
				"css",
				"javascript", -- covers JS & JSX
				"typescript", -- TS core
				"tsx", -- TSX (JSX in TS)
				"python",
			},

			sync_install = false,
			auto_install = true,
			auto_tag = true,

			highlight = {
				enable = true,
				disable = function(lang, buf)
					local max_filesize = 100 * 1024
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					return ok and stats and stats.size > max_filesize
				end,
				additional_vim_regex_highlighting = false,
			},
		})
	end,
}
