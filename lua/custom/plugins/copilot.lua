-- return {
--   -- FIX: make lazy load
--   "github/copilot.vim"
-- }
--
-- return {}
-- {
--     "zbirenbaum/copilot.lua",
--     cmd = "Copilot",
--     build = ':Copilot auth',
--     event = "InsertEnter",
--     config = function()
--         require("copilot").setup({
--           suggestion = {
--             auto_trigger = true,
--             debounce = 100,
--             keymap = {
--               accept = "<Tab>",
--             },
--           }
--         })
--     end
-- }
--         ★  copilot.lua 131.56ms
          -- ‒  copilot.lua/plugin/copilot.lua 0.24ms

return {
  "zbirenbaum/copilot-cmp",
  event = "InsertEnter",
  dependencies = {
    {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      config = function()
        require("copilot").setup({
          suggestion = { enabled = true },
          panel = { enabled = true },
        })
      end,
    },
  },
  config = function()
    require("copilot_cmp").setup()
  end,
}
