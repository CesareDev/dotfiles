return {
    'nvim-mini/mini.diff',
    version = '*',
    config = function ()
        require('mini.diff').setup({
            --view = {
                --style = 'sign',
                --signs = {
                --   add = '',
                --    change = '',
                --    delete = '',
                --},
            --},
        })
        vim.keymap.set('n', '<leader>d', ":lua MiniDiff.toggle_overlay()<CR>", {})
    end
}
