vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.cmd("set clipboard+=unnamedplus")

vim.g.mapleader = ","

-- Show relative line numbers
vim.opt.relativenumber = true

-- vim.cmd('set signcolumn=auto:2')
vim.cmd('set signcolumn=number')
-- vim.opt.wrap = false

vim.keymap.set('n', '.', ':', {})

vim.keymap.set('n', '<M-Up>', '<Up><End>Vxp<Up>V=', {})
vim.keymap.set('n', '<M-Down>', '<End>VxpV=', {})
vim.keymap.set('n', '<leader>l', 'Vy<End>p<End>', {})
vim.keymap.set('v', '<BS>', '"_d', {})

local function searchAndReplace()
    -- Prompt the user for the word to search and the replacement word
    local search_word = vim.fn.input("Search word: ")
    if search_word == "" then
        return
    end

    local replace_word = vim.fn.input("Replace with: ")

    -- Perform the search and replace operation
    vim.cmd("%s@" .. search_word .. "@" .. replace_word .. "@gc")
end
vim.keymap.set('n', '<leader>r', searchAndReplace, {})

vim.diagnostic.config({ virtual_lines = false, virtual_text = true })

local function switch_right()
    vim.cmd('bnext')
    local current_bufnr = vim.api.nvim_get_current_buf()
    local buf_type = vim.api.nvim_buf_get_option(current_bufnr, 'buftype')
    if buf_type == 'terminal' then
        vim.cmd('startinsert')
    end
end

local function switch_left()
    vim.cmd('bprev')
    local current_bufnr = vim.api.nvim_get_current_buf()
    local buf_type = vim.api.nvim_buf_get_option(current_bufnr, 'buftype')
    if buf_type == 'terminal' then
        vim.cmd('startinsert')
    end
end

-- Switch to next/previous opened buffer 
vim.keymap.set({ 'n', 't' }, '<M-Right>', switch_right, {})
vim.keymap.set({ 'n', 't' }, '<M-Left>', switch_left, {})

vim.keymap.set('n', '<leader>t', ':terminal<CR>i', {})
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', {})
