local cmp = require 'cmp'
local luasnip = require 'luasnip'

-- luasnip extends
luasnip.filetype_extend('typescript', { 'javascript' })
luasnip.filetype_extend('typescriptreact', { 'typescript' })
luasnip.filetype_extend('typescriptreact', { 'javascript' })
luasnip.filetype_extend('javascriptreact', { 'javascript' })
luasnip.filetype_extend('vue', { 'javascript' })
luasnip.filetype_extend('scss', { 'css' })


luasnip.config.setup {}
luasnip.config.set_config {
  history = true,
  updateevents = "TextChanged, TextChangedI",
  enable_autosnippets = true,
}

require("luasnip.loaders.from_lua").load({
  paths = "~/.config/kickstart/snippets",
  default_priority = 2000,
  override_priority = 2000,
})

require('luasnip.loaders.from_vscode').lazy_load()
require('vim-react-snippets').lazy_load()

require('lspsaga').setup({})

-- local lspkind = require "lspkind"
-- lspkind.init({
--   mode = 'symbol',
-- })

-- TODO: Sourcegraph
--
-- require("sg").setup({
--   enable_cody = true,
--   accept_tos = true,
--   event = "InsertEnter",
--   -- event = "TextChangedI",
-- })


cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  -- formatting = {
  --   format = require("lspkind").cmp_format({
  --     mode = 'symbol_text',
  --     maxwidth = 50,
  --     ellipsis_char = '...',
  --     show_labelDetails = true,
  --     symbol_map = {
  --       Cody = "🤖",
  --     }
  --   })
  -- },
  completion = { completeopt = 'menu,menuone,noinsert' },

  -- For an understanding of why these mappings were
  -- chosen, you will need to read `:help ins-completion`
  --
  -- No, but seriously. Please read `:help ins-completion`, it is really good!
  mapping = cmp.mapping.preset.insert {
    -- Select the [n]ext item
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Select the [p]revious item
    ['<C-p>'] = cmp.mapping.select_prev_item(),

    -- Scroll the documentation window [b]ack / [f]orward
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),

    -- Accept ([y]es) the completion.
    --  This will auto-import if your LSP supports it.
    --  This will expand snippets if the LSP sent a snippet.
    -- ['<C-y>'] = cmp.mapping.confirm { select = true },

    -- If you prefer more traditional completion keymaps,
    -- you can uncomment the following lines
    -- ['<C-CR>'] = cmp.mapping.confirm { select = true },
    -- ['<tab>'] = cmp.mapping.confirm { select = true },
    ['<C-y>'] = cmp.mapping.confirm { select = true },
    --['<Tab>'] = cmp.mapping.select_next_item(),
    --['<S-Tab>'] = cmp.mapping.select_prev_item(),

    -- Manually trigger a completion from nvim-cmp.
    --  Generally you don't need this, because nvim-cmp will display
    --  completions whenever it has completion options available.
    ['<C-Space>'] = cmp.mapping.complete {},

    -- Think of <c-l> as moving to the right of your snippet expansion.
    --  So if you have a snippet that's like:
    --  function $name($args)
    --    $body
    --  end
    --
    -- <c-l> will move you to the right of each of the expansion locations.
    -- <c-h> is similar, except moving you backwards.
    -- ['<tab>']
    --
    ['<C-n>'] = cmp.mapping(function()
      if luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      end
    end, { 'i', 's' }),
    ['<C-p>'] = cmp.mapping(function()
      if luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      end
    end, { 'i', 's' }),

    -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
    --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
  },
  sources = {
    { name = 'nvim_lsp' },
    -- TODO: Sourcegraph
    --
    { name = 'cody' },
    { name = 'luasnip' },
    { name = "buffer" },
    { name = 'path' },
  },
}

cmp.setup.filetype({ "sql" }, {
  sources = {
    { name = "vim-dadbod-completion" },
    { name = "buffer" },
  },
})
