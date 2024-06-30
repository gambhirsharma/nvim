vim.api.nvim_buf_set_keymap(0, "n", "<C-k>", ":lua require('kulala').jump_prev()<CR>", { noremap = true, silent = true })
vim.api.nvim_buf_set_keymap(0, "n", "<C-j>", ":lua require('kulala').jump_next()<CR>", { noremap = true, silent = true })
vim.api.nvim_buf_set_keymap(0, "n", "<leader><Enter>", ":lua require('kulala').run()<CR>",
	{ noremap = true, silent = true })
