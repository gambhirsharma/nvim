return {
    -- nivm-ufo folds
    {
        'kevinhwang91/nvim-ufo',
        dependencies = 'kevinhwang91/promise-async',
        config = function()
            vim.o.foldcolumn = '1' -- '0' is not bad
            vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
            vim.o.foldlevelstart = 99
            vim.o.foldenable = true

            vim.keymap.set('n', 'zR', require('ufo').openAllFolds, { desc = 'Open all folds' })
            vim.keymap.set('n', 'zM', require('ufo').closeAllFolds, { desc = 'Close all folds' })
            vim.keymap.set('n', 'zK', function()
                local winid = require('ufo').peekFoldedLinesUnderCursor()
                if not winid then
                    -- choose one of coc.nvim and nvim lsp
                    vim.fn.CocActionAsync 'definitionHover' -- coc.nvim
                    vim.lsp.buf.hover()
                end
            end, { desc = 'Peek folded lines under cursor' })

            require('ufo').setup {
                provider_selector = function(bufnr, filetype, buftype)
                    return { 'treesitter', 'indent' }
                end,
            }
        end,
    },
    -- neotree
    {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v3.x',
        cmd = 'Neotree',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-tree/nvim-web-devicons',
                config = function()
                    require("nvim-web-devicons").setup({
                        -- strict = true,
                        override = {
                            ["serverless.yml"] = {
                                icon = '󰘧',
                                color = '#FFAC45', -- Optional: set a custom color for the icon
                                name = 'ServerlessYml'
                            }
                        },
                        override_by_extension = {
                            astro = {
                                icon = "",
                                color = "#EF8547",
                                name = "astro",
                            },
                        },
                        default = true,
                    })
                end
            },
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
    -- wilder
    {
        'gelguy/wilder.nvim',
        event = 'VeryLazy',
        config = function()
            local wilder = require 'wilder'
            wilder.setup { modes = { ':', '/', '?' } }
        end,
    },
    -- Todo
    {
        'folke/todo-comments.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },
    -- undo tree
    {
        'mbbill/undotree'
    },
    -- Toggle Term
    { 'akinsho/toggleterm.nvim', version = "*", opts = { --[[ things you want to change go here]] },},
}
