return
{
  "epwalsh/obsidian.nvim",
  lazy = true,
  version = "*", -- recommended, use latest release instead of latest commit
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre /Users/gambhirsharma/Documents/OBSIDIAN/**.md",
  --   "BufNewFile /Users/gambhirsharma/Documents/OBSIDIAN/**.md",
  --   "BufNewFile /Users/gambhirsharma/Library/CloudStorage/OneDrive-Universita'degliStudidiRomaTorVergata/Engineering-Sciences/**.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
    lazy = true,

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "OBSIDIAN",
        path = "/Users/gambhirsharma/Documents/OBSIDIAN",
      },
      -- {
      --   name = "twitter-content",
      --   path = "/users/gambhirsharma/Documents/Twitter-content",
      -- },
      {
        name = "Engineering-Sciences",
        path =
        "/Users/gambhirsharma/Library/CloudStorage/OneDrive-Universita'degliStudidiRomaTorVergata/Engineering-Sciences"
      },
    },
    -- see below for full list of options 👇
  },
}
