return {
    "nvimdev/indentmini.nvim",
    config = function()
        require("indentmini").setup() -- use default config
        -- There is no default value.
        vim.cmd.highlight('IndentLine guifg=#594f46')
        -- Current indent line highlight
        vim.cmd.highlight('IndentLineCurrent guifg=#fbf1c7')
    end,
}
