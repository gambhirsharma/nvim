-- wrap selection in JSON.stringify(*)
vim.api.nvim_buf_set_keymap(0, "v", ",js", [[cJSON.stringify(<c-r>"<esc>]],
	{ noremap = false, desc = "Convert to JSON string" })

vim.opt.colorcolumn = "170"
