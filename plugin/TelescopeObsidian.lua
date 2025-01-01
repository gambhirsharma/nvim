local telescope = require("telescope")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

-- Function to dynamically fetch Obsidian.nvim commands
function TelescopeObsidianCommands()
  -- Get all available commands
  local all_commands = vim.api.nvim_get_commands({})
  local obsidian_commands = {}

  -- Filter commands that start with "Obsidian"
  for name, _ in pairs(all_commands) do
    if name:match("^Obsidian") then
      table.insert(obsidian_commands, name)
    end
  end

  -- Show commands in Telescope
  require("telescope.pickers").new({}, {
    prompt_title = "Obsidian.nvim Commands",
    finder = require("telescope.finders").new_table {
      results = obsidian_commands,
    },
    sorter = require("telescope.config").values.generic_sorter({}),
    attach_mappings = function(_, map)
      map("i", "<CR>", function(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        vim.cmd(selection[1])
      end)
      return true
    end,
  }):find()
end

-- Keybinding to show Obsidian commands
vim.api.nvim_set_keymap("n", "<leader>ob", ":lua TelescopeObsidianCommands()<CR>", { noremap = true, silent = true })
