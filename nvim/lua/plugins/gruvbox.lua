return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = true,
    opts = ...,
    config = function()
        vim.o.background = "dark" -- or "light" for light mode
        require("gruvbox").setup({
            contrast = "hard",
        })
        vim.cmd("colorscheme gruvbox")
    end
}
