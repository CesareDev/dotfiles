return {
    {
        "mason-org/mason.nvim",
        opts = {},
        config = function()
            require("mason").setup()
        end
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "clangd",
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            'saghen/blink.cmp'
        },
        config = function()
            -- Defined in the completions.lua file
            local capabilities = require('blink.cmp').get_lsp_capabilities()

            vim.lsp.config("lua_ls", {
                capabilities = capabilities
            })

            vim.lsp.config("cmake", {
                capabilities = capabilities
            })

            vim.lsp.config("clangd", {
                capabilities = capabilities,
                filetypes = { "c", "cpp", "h", "hpp", "objc", "objcpp", },
                cmd = {
                    "clangd",
                    "--function-arg-placeholders=0",
                    "--offset-encoding=utf-16",
                    "--background-index",
                    "--header-insertion=never",
                    "--suggest-missing-includes",
                    "--query-driver=/usr/bin/c++",
                    "--completion-style=detailed",
                    "--pretty",
                    "--compile-commands-dir=build"
                },
            })

            vim.keymap.set('n', '<tab>', vim.lsp.buf.hover, {})
            vim.keymap.set('n', '<leader>h', vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "ge", vim.diagnostic.goto_next, {})

        end
    },
    --{
        --"ray-x/lsp_signature.nvim",
        --event = "InsertEnter",
        --opts = {
            -- cfg options
        --},
    --}
}
