return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = { "lua", "c", "cpp", "go" },
            highlight = { enable = true },
            indenting = { enable = true }
        })
    end
}
