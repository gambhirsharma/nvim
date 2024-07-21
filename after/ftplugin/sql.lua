-- if get(g:, 'db_ui_disable_mappings', 0)
--   finish
-- endif
--
-- call db_ui#utils#set_mapping('<Leader>W', '<Plug>(DBUI_SaveQuery)')
-- call db_ui#utils#set_mapping('<Leader>E', '<Plug>(DBUI_EditBindParameters)')
-- call db_ui#utils#set_mapping('<Leader>S', '<Plug>(DBUI_ExecuteQuery)')
-- call db_ui#utils#set_mapping('<Leader>S', '<Plug>(DBUI_ExecuteQuery)', 'v')

-- Check if 'db_ui_disable_mappings' is set and return if it is not zero
if vim.g.db_ui_disable_mappings == nil then
  vim.g.db_ui_disable_mappings = 0
end

if vim.g.db_ui_disable_mappings ~= 0 then
  return
end

-- Set mappings
local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<Leader>W', '<Plug>(DBUI_SaveQuery)', opts)
vim.api.nvim_set_keymap('n', '<Leader>E', '<Plug>(DBUI_EditBindParameters)', opts)
vim.api.nvim_set_keymap('n', '<Leader>S', '<Plug>(DBUI_ExecuteQuery)', opts)
vim.api.nvim_set_keymap('v', '<Leader>S', '<Plug>(DBUI_ExecuteQuery)', opts)

