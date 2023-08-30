local options = { noremap = true, silent = true }

local map = function(mode, key, results)
    vim.api.nvim_set_keymap(
        mode,
        key,
        results,
        options
    )
end

function WinMove(key)
    local curwin = vim.api.nvim_get_current_win()
    vim.cmd("wincmd " .. key)
    if curwin == vim.api.nvim_get_current_win() then
        if string.match(key, "[jk]") then
            vim.cmd("wincmd s")
        else
            vim.cmd("wincmd v")
        end
        vim.cmd("wincmd " .. key)
    end
end

-- netrw
map('n', '<leader>pv', '<Cmd>Ex<CR>')
map('n', '<leader><leader><leader><leader><leader><leader>l', '<Plug>NetrwRefresh')

-- pane navigation
map('n', '<C-h>', ':lua WinMove("h")<CR>')
map('n', '<C-j>', ':lua WinMove("j")<CR>')
map('n', '<C-k>', ':lua WinMove("k")<CR>')
map('n', '<C-l>', ':lua WinMove("l")<CR>')

-- tabs
map('n', '<C-t>', '<Cmd>tabe<CR>')
map('n', '<C-n>', '<Cmd>tabn<CR>')
map('n', '<C-x>', '<Cmd>tabc<CR>')

-- code actions
map('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<CR>')

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("x", "<leader>p", [["_dP]])

map("n", "<leader>y", [["+y]])
map("v", "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

map("n", "<leader>d", [["_d]])
map("v", "<leader>d", [["_d]])

map("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- nvim rest
map("n", "<leader>r", "<Plug>RestNvim")
