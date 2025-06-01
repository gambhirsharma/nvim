-- NOTE: Focus on coding — changing the color scheme won’t write the code for you.

return {
  {
    'folke/tokyonight.nvim',
    name = "tokyonight",
    opts = {
      transparent = false,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
    init = function()
      -- modifying tokyonight-night colorscheme
      local styles = require("tokyonight.colors").styles
      ---@type Palette
      local darker_night_colors = {
        bg = "#1C1C1C",
      }
      styles.night = vim.tbl_extend("force", styles.night, darker_night_colors)


      vim.cmd.colorscheme 'tokyonight-night'
      -- vim.cmd.colorscheme 'tokyonight-day'
      vim.cmd.hi 'Comment gui=none'
    end,
  },
  -- {
  --   "nyoom-engineering/oxocarbon.nvim",
  --   name = "oxocarbon",
    -- init = function()
      -- vim.cmd.colorscheme 'oxocarbon'
    -- end
  -- },
  -- vercel.nvim
  -- {
  --   'tiesen243/vercel.nvim',
    -- init = function()
    --   vim.cmd.colorscheme 'vercel'
    -- end

  -- },

  -- Cyberdream.nvim
  -- {
  --   "scottmckendry/cyberdream.nvim",
  --   name = "cyberdream",
  --   lazy = true,
  --   priority = 1000,
  --   init = function()
      -- vim.cmd.colorscheme 'cyberdream'
  --   end,
  --   config = function()
  --     require('cyberdream').setup({
  --       transparent = true,
  --     })
  --   end,
  -- },
  -- {
  --   'ellisonleao/gruvbox.nvim',
  --   lazy = true,
  --   config = function()
  --     require('gruvbox').setup({
        -- transparent_mode = true,
      -- })
      -- vim.cmd('colorscheme gruvbox')
    -- end
    -- init = function()
    --   vim.cmd.colorscheme 'gruvbox-light'
    -- end
  -- },
  -- {
  --   'rose-pine/neovim',
  --   lazy = true,
  --   name = 'rose-pine',
    -- priority = 1000,
    -- config = function()
    --   require('rose-pine').setup {
    --     styles = {
    --       bold = true,
    --       italic = true,
    --       transparency = true,
    --     },
    --   }
      -- vim.cmd.colorscheme 'rose-pine'
    -- end,
  -- },
  -- {
  --   'Shatur/neovim-ayu',
  --       lazy = true,
  --   name = 'ayu',
    --   priority = 1000
  -- },
  -- {
  --   'sainnhe/everforest',
  --   lazy = true,
  --   name = 'everforest',
    --   priority = 1000
  -- },
  -- {
  --   'datsfilipe/vesper.nvim',
  --   lazy = true,
  --   name = 'vesper',
  --   init = function()
      -- vim.cmd.colorscheme 'vesper'
  --   end
  --
  -- },

  -- Lua
--   {
--     'tjdevries/colorbuddy.nvim',
--     lazy = true,
--
--     -- priority = 1000,
--     init = function()
--       -- colorscheme add
--       -- vim.cmd.colorscheme "gruvbuddy"
--     end,
--   },
--   {
--     'olivercederborg/poimandres.nvim',
--     --    lazy = false,
--     lazy = true,
--     priority = 1000,
--     config = function()
--       require('poimandres').setup {
--         -- leave this setup function empty for default config
--         -- or refer to the configuration section
--         bold_vert_split = false,          -- use bold vertical separators
--         dim_nc_background = false,        -- dim 'non-current' window backgrounds
--         disable_background = false,       -- disable background
--         disable_float_background = false, -- disable background for floats
--         disable_italics = false,          -- disable italics     -- for configuration options
--       }
--     end,
--
--     -- optionally set the colorscheme within lazy config
--     init = function()
--       -- vim.cmd("colorscheme poimandres")
--     end
--   }, {
--   -- dir = '~/coding/NeoVim-Plugins-dev/appwrite.nvim/',
--   -- init = function()
--   --   vim.cmd.colorscheme 'appwrite'
--   -- end,
-- },
--   {
-- 		"catppuccin/nvim",
-- 		name = "catppuccin",
-- 		priority = 1000,
--     init = function()
--       -- vim.cmd.colorscheme 'catppuccin-macchiato'
--       -- vim.cmd.colorscheme 'catppuccin-latte'
--       -- vim.cmd.hi 'Comment gui=none'
--     end,
--
-- 		opts = {
-- 			no_italic = true,
-- 			term_colors = true,
-- 			transparent_background = false,
-- 			styles = {
-- 				comments = {},
-- 				conditionals = {},
-- 				loops = {},
-- 				functions = {},
-- 				keywords = {},
-- 				strings = {},
-- 				variables = {},
-- 				numbers = {},
-- 				booleans = {},
-- 				properties = {},
-- 				types = {},
-- 			},
-- 			color_overrides = {
-- 				mocha = {
-- 					base = "#000000",
-- 					mantle = "#000000",
-- 					crust = "#000000",
-- 				},
-- 			},
-- 			integrations = {
-- 				telescope = {
-- 					enabled = true,
-- 					style = "nvchad",
-- 				},
-- 				dropbar = {
-- 					enabled = true,
-- 					color_mode = true,
-- 				},
-- 			},
-- 		},
-- 	},
}
