-- markdown ftplugin
vim.opt_local.colorcolumn = "101"
vim.opt.autoindent = true
vim.opt.linebreak = true
-- @TODOUA:
-- spell is not staying local for some reason
-- have to set nospell in other fts that are opened after a markdown
vim.opt_local.spell = true

-- OBSIDIAN.nvim setting
vim.opt_local.conceallevel = 1


-- *markdown surround maps - with nvim-surround and without*
-- wrap selection in markdown link
vim.api.nvim_buf_set_keymap(0, "v", ",wl", [[c[<c-r>"]()<esc>]], { noremap = false, desc = "[W]rap [L]ink" })
-- italicize Word - in visual: S{arg}
vim.api.nvim_buf_set_keymap(0, "n", "<leader>_", "ysiW_", { noremap = false })
-- Markdown Preview
-- For Glow, just type :Glow
vim.api.nvim_buf_set_keymap(0, "n", ",md", "<Plug>MarkdownPreview", { noremap = false })
-- toggle TS highlighting for markdown
vim.api.nvim_buf_set_keymap(0, "n", ",th", ":TSBufToggle highlight<CR>", { noremap = false })

-- vim.api.nvim_exec(
--     [[
-- " arrows
-- iabbrev >> →
-- iabbrev << ←
-- iabbrev ^^ ↑
-- iabbrev VV ↓
--
-- " eunuch map
-- nmap <buffer><silent><localleader>rn :Rename<space>
--
-- " snippets for markdown
-- let b:vsnip_snippet_dir = expand('~/.config/nvim/snippets/')
-- ]],
--     false
-- )

-- Persist Markdown Folds
-- vim.api.nvim_create_augroup("PersistMarkdownFolds", {})
-- vim.api.nvim_create_autocmd("BufWinLeave", { command = "mkview", pattern = "*.md", group = "PersistMarkdownFolds" })
-- vim.api.nvim_create_autocmd(
--     "BufWinEnter",
--     { command = "silent! loadview", pattern = "*.md", group = "PersistMarkdownFolds" }
-- )

-- match and highlight hyperlinks
-- -- standalone
vim.fn.matchadd("matchURL", [[http[s]\?:\/\/[[:alnum:]%\/_#.-]*]])
vim.cmd "hi matchURL guifg=DodgerBlue"

-- grey out for strikethrough
vim.fn.matchadd("matchStrike", [[[~]\{2}.\+[~]\{2}]])
vim.cmd "hi matchStrike guifg=gray"

-- Setup cmp setup buffer configuration - 👻 text off for markdown
-- local cmp = require "cmp"
-- cmp.setup.buffer {
--     sources = {
--         { name = "vsnip" },
--         { name = "spell" },
--         {
--             name = "buffer",
--             option = {
--                 get_bufnrs = function()
--                     -- @TODOUA: Trying out just populate from visible buffers. Keep?
--                     local bufs = {}
--                     for _, win in ipairs(vim.api.nvim_list_wins()) do
--                         bufs[vim.api.nvim_win_get_buf(win)] = true
--                     end
--                     return vim.tbl_keys(bufs)
--                 end,
--             },
--         },
--         { name = "path" },
--     },
--     experimental = {
--         ghost_text = false,
--     },
-- }




-- toggle checkbox code

local M = {}

M._add_checkbox = function(character, line_num)
    local line = vim.api.nvim_buf_get_lines(0, line_num - 1, line_num, false)[1]

    local checkbox_pattern = "^%s*- %[.] "
    local checkbox = character or " "

    if not string.match(line, checkbox_pattern) then
        local unordered_list_pattern = "^(%s*)[-*+] (.*)"
        if string.match(line, unordered_list_pattern) then
            line = string.gsub(line, unordered_list_pattern, "%1- [ ] %2")
        else
            line = string.gsub(line, "^(%s*)", "%1- [ ] ")
        end
    end
    local capturing_checkbox_pattern = "^(%s*- %[).(%] )"
    line = string.gsub(line, capturing_checkbox_pattern, "%1" .. checkbox .. "%2")

    -- 0-indexed
    vim.api.nvim_buf_set_lines(0, line_num - 1, line_num, true, { line })
end

M._remove_checkbox = function(line_num)
    local line = vim.api.nvim_buf_get_lines(0, line_num - 1, line_num, false)[1]
    local checkbox_pattern = "^%s*- %[.]. "
    local capturing_checkbox_pattern = "^(%s*-) %[.%] (.*)"
    line = string.gsub(line, capturing_checkbox_pattern, "%1 %2")
    line = string.gsub(line, checkbox_pattern, "")
    -- 0-indexed
    vim.api.nvim_buf_set_lines(0, line_num - 1, line_num, true, { line })
end

M.toggle_checkbox = function(character)
    -- Check if we are in visual line mode
    local mode = vim.api.nvim_get_mode().mode

    local toggle_or_remove = function(character, line_num)
        if character == nil then
            -- Remove checkbox
            M._remove_checkbox(line_num)
        else
            -- Add checkbox
            M._add_checkbox(character, line_num)
        end
    end

    if mode == 'V' or mode == 'v' then
        -- Get the range of selected lines
        vim.cmd([[execute "normal! \<ESC>"]])
        local vstart = vim.fn.getcharpos("'<")
        local vend = vim.fn.getcharpos("'>")

        local line_start = vstart[2]
        local line_end = vend[2]

        -- Iterate over each line in the range and apply the transformation
        for line_num = line_start, line_end do
            toggle_or_remove(character, line_num)
        end
    else
        -- Normal mode
        -- Allow line_num to be optional, defaulting to the current line if not provided (normal mode)
        local line_num = unpack(vim.api.nvim_win_get_cursor(0))
        toggle_or_remove(character, line_num)
    end
end

vim.keymap.set({ "n", "v" }, "<leader>nd", function() M.toggle_checkbox("x") end, { desc = "Todo done", noremap = true })
vim.keymap.set({ "n", "v" }, "<leader>nc", function() M.toggle_checkbox("o") end,
    { desc = "Todo canceled", noremap = true })
vim.keymap.set({ "n", "v" }, "<leader>nu", function() M.toggle_checkbox(" ") end,
    { desc = "Todo undone", noremap = true })
vim.keymap.set({ "n", "v" }, "<leader>ni", function() M.toggle_checkbox("~") end,
    { desc = "Todo in progress", noremap = true })
vim.keymap.set({ "n", "v" }, "<leader>nr", function() M.toggle_checkbox() end, { desc = "Remove todo", noremap = true })


-- end
-- 
--
