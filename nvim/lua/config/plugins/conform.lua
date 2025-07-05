return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				-- Lua
				lua = { "stylua" },
				-- Go
				go = { "goimports", "gofmt" },
				-- HTML / CSS / Tailwind / JSX / TSX / JS / JSON
				html = { "prettier" },
				css = { "prettier" },
				scss = { "prettier" },
				less = { "prettier" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				json = { "prettier" },
				jsonc = { "prettier" },
				yaml = { "prettier" },
				-- Python
				python = { "black" },
				-- Shell
				sh = { "shfmt" },
				bash = { "shfmt" },
				-- Dockerfiles
				dockerfile = { "prettier" },
			},
			format_on_save = {
				enabled = true,
				lsp_fallback = true,
			},
			formatters = {
				prettier = {
					prepend_args = {
						"--semi",
						"true",
						"--single-quote",
						"false",
					},
				},
			},
		})
	end,
}
