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
				-- HTML / CSS / Tailwind / JSX / TSX / JS / JSON / MD
				html = { "rustywind", "prettier" },
				css = { "prettier" },
				scss = { "prettier" },
				less = { "prettier" },
				javascript = { "rustywind", "prettier" },
				javascriptreact = { "rustywind", "prettier" },
				typescript = { "rustywind", "prettier" },
				typescriptreact = { "rustywind", "prettier" },
				json = { "prettier" },
				jsonc = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				-- Python
				python = { "ruff", "isort", "black" },
				-- Shell
				sh = { "shfmt" },
				bash = { "shfmt" },
				-- Dockerfiles
				dockerfile = { "prettier" },
				-- TOML
				toml = { "taplo" },
				-- Rust
				rust = { "rustfmt" },
			},
			format_on_save = {
				enabled = true,
				lsp_format = "fallback",
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
