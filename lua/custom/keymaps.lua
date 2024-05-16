vim.keymap.set("i", "jj", "<esc>", { desc = "Normal mode" })
vim.keymap.set("n", "<leader>qq", ":q!<CR>", { desc = "Exit" })
vim.keymap.set({ 't' }, '<C-q>', '<C-\\><C-n>')

vim.keymap.set("n", "<leader>l", ":Lazy<CR>", {desc = "Lazy"})

vim.keymap.set("n", "<leader>tb", ":split | :terminal <CR>", { desc = "Exit" })

-- vim.keymap.set("n", ";", ":", { desc = "Enter command mode" })

-- move selection in visual mode
vim.keymap.set("v", "K", ":move '<-2<CR>gv=gv", { desc = "Move selection up" })
vim.keymap.set("v", "J", ":move '>+1<CR>gv=gv", { desc = "Move selection down" })

-- Cody Chat
vim.keymap.set("n", "<leader>cs", "<cmd>CodyChat<CR>", {desc = "Cody Chat", remap = ture})
vim.keymap.set("n", "<leader>ct", "<cmd>CodyToggle<CR>", {desc = "Cody Toggle", remap = ture})
-- vim.keymap.set("n", "<leader>cd", ":CodyTask<Space>", {desc = "Cody Task", remap = ture})

-- Notes 
vim.keymap.set('n', "<leader>nt", "<cmd>Telescope find_files cwd=~/Documents/Notes<CR>", {desc="Notes"})
