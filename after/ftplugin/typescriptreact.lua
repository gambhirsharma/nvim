-- require("./javascript.lua")
-- wrap selection in JSON.stringify(*)
vim.api.nvim_buf_set_keymap(0, "v", ",js", [[cJSON.stringify(<c-r>"<esc>]],
	{ noremap = false, desc = "Convert to JSON string" })

vim.opt.colorcolumn = "70"

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
