-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- neotree
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    cmd = 'Neotree',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    keys = {
      {
        '<leader>fe',
        function()
          require('neo-tree.command').execute { toggle = true, dir = vim.uv.cwd() }
        end,
        desc = 'Explorer NeoTree (cwd)',
      },
      { '<leader>e', '<leader>fe', desc = 'Explorer NeoTree (root dir)', remap = true },
    },
    opts = {
      window = {
        position = 'right',
      },
    },
  },
  --autoclose tags
  { 'm4xshen/autoclose.nvim' },
  -- wakatime
  { 'wakatime/vim-wakatime', lazy = false },
  -- discord
  {
    "andweeb/presence.nvim",
    enabled = true,
    event = "VeryLazy",
  },
  -- wilder
  {
    'gelguy/wilder.nvim',
    event = 'VeryLazy',
    config = function()
      local wilder = require 'wilder'
      wilder.setup { modes = { ':', '/', '?' } }
    end,
  },


}
