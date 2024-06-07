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
  -- indent blankline
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  -- wakatime
  { 'wakatime/vim-wakatime', lazy = false },
  -- discord
  {
    "andweeb/presence.nvim",
    enabled = true,
    event = "VeryLazy",
  },
  -- harpoon2
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    opts = {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
      settings = {
        save_on_toggle = true,
      },
    },
    keys = function()
      local keys = {
        {
          "<leader>H",
          function()
            require("harpoon"):list():add()
          end,
          desc = "Harpoon File",
        },
        {
          "<leader>h",
          function()
            local harpoon = require("harpoon")
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          desc = "Harpoon Quick Menu",
        },
      }

      for i = 1, 5 do
        table.insert(keys, {
          "<leader>" .. i,
          function()
            require("harpoon"):list():select(i)
          end,
          desc = "Harpoon to File " .. i,
        })
      end
      return keys
    end,
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
  -- hardtime
  {
    "m4xshen/hardtime.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {}
  },
  -- precognition
  {
    "tris203/precognition.nvim",
    event = "VeryLazy",
  },
  -- test http requirest
  {
    'diepm/vim-rest-console',
  },
  -- lazy git 
-- nvim v0.8.0
 {
  "kdheepak/lazygit.nvim",
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  -- optional for floating window border decoration
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  -- setting the keybinding for LazyGit with 'keys' is recommended in
  -- order to load the plugin when the command is run for the first time
  keys = {
    { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
  }
},
--
}
