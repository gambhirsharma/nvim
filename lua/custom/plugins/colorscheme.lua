return {
  -- colorschemes
  {   -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
    priority = 1000,   -- Make sure to load this before all the other start plugins.
    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      -- vim.cmd.colorscheme 'tokyonight-night'

      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
  },
  {
    'LunarVim/lunar.nvim',
    priority = 1000,   -- Make sure to load this before all the other start plugins.
    init = function()
      vim.cmd.colorscheme 'lunar'
    end
  },
  { 'ellisonleao/gruvbox.nvim', priority = 1000,     config = true },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000,
    config = function()
      require('rose-pine').setup {
        styles = {
          bold = true,
          italic = true,
          transparency = true,
        },
      }
      -- vim.cmd.colorscheme 'rose-pine'
    end,
  },
  { 'Shatur/neovim-ayu',        name = 'ayu',        priority = 1000 },
  { 'sainnhe/everforest',       name = 'everforest', priority = 1000 },
  -- Lua
  {
    'tjdevries/colorbuddy.nvim',

    priority = 1000,
    init = function()
      -- colorscheme add
      -- vim.cmd.colorscheme "gruvbuddy"
    end,
  },
}
