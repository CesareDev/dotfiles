return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local fb_actions = require "telescope".extensions.file_browser.actions
            local actions = require("telescope.actions")
            require('telescope').setup({
                defaults = {
                    theme = "center",
                    sorting_strategy = "ascending",
                    layout_config = {
                        horizontal = {
                            prompt_position = "bottom",
                        },
                    },
                    mappings = {
                        i = {
                            ["<esc>"] = actions.close
                        },
                    },
                },
                extensions = {
                    file_browser = {
                        display_stat = false,
                        grouped = true,
                        mappings = {
                            ["i"] = {
                                ["<C-a>"] = fb_actions.create,
                                ["<C-d>"] = fb_actions.remove,
                                ["<C-r>"] = fb_actions.rename,
                                ["<C-c>"] = fb_actions.copy,
                            }
                        },
                    }
                }
            })

            require("telescope").load_extension "file_browser"
            local extension = require('telescope').extensions.file_browser
            local builtin = require('telescope.builtin')

            vim.keymap.set({ 'n', 't' }, '<leader>o', builtin.find_files, {})
            vim.keymap.set({ 'n', 't' }, '<leader>g', builtin.live_grep, {})
            vim.keymap.set({ 'n', 't' }, '<leader>f', extension.file_browser, {})
        end
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
            require('telescope').setup({
                extensions = {
                    ['ui-select'] = {
                        require('telescope.themes').get_dropdown {}
                    }
                }
            })
            require('telescope').load_extension('ui-select')
        end
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }
}
