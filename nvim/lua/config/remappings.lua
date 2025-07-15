-- Keybinds
vim.keymap.set("n", "<leader>ns", ":edit ~/dotfiles/<CR>")
vim.keymap.set("n", "<leader>nt", function()
	vim.cmd("tabnew")
	require("telescope.builtin").find_files()
end)
vim.keymap.set("n", "<leader>ct", ":tabclose<CR>")
vim.keymap.set("n", "<leader>ww", ":w<CR>")
vim.keymap.set("n", "<leader>fq", ":q<CR>")
vim.keymap.set("n", "<leader>qq", ":q!<CR>")
vim.keymap.set("n", "<leader>wq", ":wq<CR>")
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("v", "jk", "<Esc>")
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>d", "<C-d>zz")
vim.keymap.set("n", "<leader>u", "<C-u>zz")
vim.keymap.set("n", "<leader>err", function()
	vim.api.nvim_put({
		"if err != nil {",
		'    log.Printf("\\nError: %s", err)',
		"}",
	}, "l", true, true)
	vim.cmd('normal! k0f"')
end)
vim.keymap.set("n", "<leader>erf", function()
	vim.api.nvim_put({
		"if err != nil {",
		'    log.Fatalf("\\nError: %s", err)',
		"}",
	}, "l", true, true)
	vim.cmd('normal! k0f"')
end)
