_G.autosave_enabled = true

local function clear_cmdarea()
  vim.defer_fn(function()
    vim.api.nvim_echo({}, false, {})
  end, 800)
end

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  callback = function()
    if _G.autosave_enabled and #vim.api.nvim_buf_get_name(0) ~= 0 and vim.bo.buflisted then
      vim.cmd "silent w"

      local time = os.date "%I:%M %p"

      -- print nice colored msg
      vim.api.nvim_echo({ { "󰄳", "LazyProgressDone" }, { " file autosaved at " .. time } }, false, {})

      clear_cmdarea()
    end
  end,
})

vim.api.nvim_create_user_command("AutosaveEnabled", function()
  _G.autosave_enabled = true
  print("Autosave enabled")
end, {})

vim.api.nvim_create_user_command("AutosaveDisable", function()
  _G.autosave_enabled = false
  print("Autosave disabled")
end, {})

