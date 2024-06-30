local set = vim.opt_local

-- Set local settings for terminal buffers
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", {}),
  callback = function()
    set.number = false
    set.relativenumber = false
    set.scrolloff = 0

    vim.bo.filetype = "terminal"
  end,
})

-- Easily hit escape in terminal mode.
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = 'Exit Terminal mode' })

-- Open a terminal at the bottom of the screen with a fixed height.
vim.keymap.set("n", "<leader>tb", function()
  vim.cmd.new()
  vim.cmd.wincmd "J"
  vim.api.nvim_win_set_height(0, 12)
  vim.wo.winfixheight = true
  vim.cmd.term()
end, { desc = "[T]erminal open [B]ottom" })

-- vim.keymap.set("n", "<leader>tb", ":12split | :terminal <CR>", { desc = "Open horizontal terminal split" })

-- terminal keymaps
-- vim.keymap.set("t", "<C-q>", "<C-\\><C-n>")
vim.keymap.set("t", "<C-h>", "<C-\\><C-n> <C-h>")
vim.keymap.set("t", "<C-j>", "<C-\\><C-n> <C-j>")
vim.keymap.set("t", "<C-k>", "<C-\\><C-n> <C-k>")
vim.keymap.set("t", "<C-l>", "<C-\\><C-n> <C-l>")
