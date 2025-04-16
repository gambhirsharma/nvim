return {
    -- nivm-ufo folds
    {
        'kevinhwang91/nvim-ufo',
          event = "BufReadPost",
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
                                icon = 'ϟ',
                                color = '#FD5750', -- Optional: set a custom color for the icon
                                name = 'ServerlessYml'
                            }
                        },
                        override_by_extension = {
                            astro = {
                                icon = "",
                                color = "#E23AAF",
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
            filesystem = {
                filtered_items = {
                    -- visible = true, -- Show hidden files and directories
                    hide_dotfiles = true, -- This ensures dotfiles (like .gitignore) are not hidden
                    hide_gitignored = true,
                },
                git = {
                    enable = true,  -- Enable git integration (makes Neo-tree aware of `.gitignore`)
                    ignore_list = { -- You can also define additional ignores if needed
                        ".git", ".gitignore", ".DS_Store", "node_modules",
                    },
                }
            },
        }
        -- new changes

        -- new change end
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
        event = "VeryLazy",
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
    {
        'akinsho/toggleterm.nvim',
        event = "VeryLazy",
        version = "*",
        opts = { --[[ things you want to change go here]] },
    },
    -- oil.nvim
    {
        "stevearc/oil.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("oil").setup {
                columns = { "icon" },
                keymaps = {
                    ["<C-h>"] = false,
                    ["<C-l>"] = false,
                    ["<C-k>"] = false,
                    ["<C-j>"] = false,
                    ["<M-h>"] = "actions.select_split",
                },
                view_options = {
                    show_hidden = true,
                },
            }

            -- Open parent directory in current window
            vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

            -- Open parent directory in floating window
            vim.keymap.set("n", "<space>-", require("oil").toggle_float)
        end,
    },
    -- file diff
    {
        "sindrets/diffview.nvim",
        event = "VeryLazy",
    }
    -- {
    --     "sphamba/smear-cursor.nvim",
    --
    --     opts = {
    --         -- Smear cursor color. Defaults to Cursor GUI color if not set.
    --         -- Set to "none" to match the text color at the target cursor position.
    --         cursor_color = "#d3cdc3",
    --
    --         -- Background color. Defaults to Normal GUI background color if not set.
    --         normal_bg = "#282828",
    --
    --         -- Smear cursor when switching buffers or windows.
    --         smear_between_buffers = true,
    --
    --         -- Smear cursor when moving within line or to neighbor lines.
    --         smear_between_neighbor_lines = true,
    --
    --         -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
    --         -- Smears will blend better on all backgrounds.
    --         legacy_computing_symbols_support = false,
    --     },
    -- }
}
