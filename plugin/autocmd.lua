-- vim.api.nvim_create_autocmd({ "Filetype" }, {
--   pattern = { "typescript", "typescriptreact" },
--   callback =
--       function()
--         vim.cmd("source ../after/ftplugin/javascript.lua")
--       end
-- })
-- vim.api.nvim_create_user_command('MyAvanteChat', function()
--   require("yetone/avante.nvim").open({
--     windows = {
--       width = 100,
--     },
--   })
-- end, {})
--
function _G.compare_to_clipboard()
	local ftype = vim.api.nvim_eval("&filetype")
	vim.cmd("vsplit")
	vim.cmd("enew")
	vim.cmd("normal! P")
	vim.cmd("setlocal buftype=nowrite")
	vim.cmd("set filetype="..ftype)
	vim.cmd("diffthis")
	vim.cmd([[execute "normal! \<C-w>h"]])
	vim.cmd("diffthis")
end

vim.keymap.set("n", "<leader>cc", _G.compare_to_clipboard, { desc = "Compare with clipboard", noremap = true, silent = true })
