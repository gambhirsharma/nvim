return {
  { 
    'folke/tokyonight.nvim',
    name = "tokyonight",
    priority = 1000,
    opts = {
      transparent = false,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
    init = function()
      vim.cmd.colorscheme 'tokyonight-night'
      vim.cmd.hi 'Comment gui=none'
    end,
  }
}
