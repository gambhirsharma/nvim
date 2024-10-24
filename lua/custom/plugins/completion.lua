return
{
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    priority = 100,
    dependencies = {
        -- Snippet Engine & its associated nvim-cmp source
        -- Adds other completion capabilities.
        --  nvim-cmp does not ship with all sources by default. They are split
        --  into multiple repos for maintenance purposes.
            --  TODO: Sourcegraph
            --
        -- "sourcegraph/sg.nvim",
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
        "onsails/lspkind.nvim",
        'nvimdev/lspsaga.nvim',
        {
            'L3MON4D3/LuaSnip',
            build = "make install_jsregexp",
            dependencies = {
                -- `friendly-snippets` contains a variety of premade snippets.
                --    See the README about individual language/framework/plugin snippets:
                --    https://github.com/rafamadriz/friendly-snippets
                -- {
                --   'rafamadriz/friendly-snippets',
                --   config = function()
                --     require('luasnip.loaders.from_vscode').lazy_load()
                --   end,
                -- },
                -- vim-react-snippets for luasnip
                'rafamadriz/friendly-snippets',
                'mlaursen/vim-react-snippets',
            },
        },
        'saadparwaiz1/cmp_luasnip',
    },
    config = function()
        require('custom.config.completion')
    end
}
