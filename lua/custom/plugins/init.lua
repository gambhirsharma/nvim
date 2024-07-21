-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  --autoclose tags
  { 'm4xshen/autoclose.nvim' },
  -- wakatime
  { 'wakatime/vim-wakatime', lazy = false },
  -- comment
  {
    "folke/ts-comments.nvim",
    opts = {},
    -- event = "VeryLazy",
    -- enabled = vim.fn.has("nvim-0.10.0") == 1,
  },
  -- discord
  {
    'andweeb/presence.nvim',
    enabled = true,
    event = 'VeryLazy',
  },
  -- hardtime
  -- {
  --   'm4xshen/hardtime.nvim',
  --   event = 'VeryLazy',
  --   dependencies = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim' },
  --   opts = {},
  -- },
  -- precognition
  -- {
  --   'tris203/precognition.nvim',
  --   event = 'VeryLazy',
  -- },
  -- test http requirest
  -- {
  --   'diepm/vim-rest-console',
  -- },
  -- lazy git
  -- nvim v0.8.0
  {
    'kdheepak/lazygit.nvim',
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
  },
  -- Kulala (HTTP)
  -- {
  --   'mistweaverco/kulala.nvim',
  --   config = function()
  --     require('kulala').setup()
  --   end
  -- },
  -- REST.nvim
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
    opts = {
      rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" }
    }
  },
  {
    "rest-nvim/rest.nvim",
    ft = "http",
    dependencies = { "luarocks.nvim" },
    config = function()
      require("rest-nvim").setup()
    end,
  },
  -- markdownPreview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_theme = "dark"
      vim.g.mkdp_refresh_slow = 1
      vim.g.mkdp_open_to_the_world = 1
      vim.g.mkdp_open_ip = "127.0.0.1"
      vim.g.mkdp_echo_preview_url = 1
      vim.g.mkdp_port = "7777"
      -- vim.g.mkdp_browser = '/Applications/Safari.app'
      vim.g.mkdp_preview_options = {
        mkit = {},
        katex = {},
        uml = { server = "http://localhost:7777" },
        disable_sync_scroll = 0,
        sync_scroll_type = "middle",
        hide_yaml_meta = 1,
        sequence_diagrams = {},
        flowchart_diagrams = {},
        content_editable = false,
      }
    end,
    ft = { "markdown" },
  }
}
