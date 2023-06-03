local options = { noremap = true, silent = true }

local map = function(mode, key, results)
    vim.api.nvim_set_keymap(
        mode,
        key,
        results,
        options
    )
end

map('n', '<leader>pv', '<Cmd>Ex<CR>')

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- greatest remap ever
map("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
map("n", "<leader>y", [["+y]])
map("v", "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

map("n", "<leader>d", [["_d]])
map("v", "<leader>d", [["_d]])

map("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- map("n", "<C-k>", "<cmd>cnext<CR>zz")
-- map("n", "<C-j>", "<cmd>cprev<CR>zz")
-- map("n", "<leader>k", "<cmd>lnext<CR>zz")
-- map("n", "<leader>j", "<cmd>lprev<CR>zz")

map("n", "<leader><leader>", '<Cmd>so<CR>')

map("n", "<leader>r", "<Plug>RestNvim")

vim.keymap.set("n", "<leader>t", function() require("neotest").run.run() end)
-- map("n", "<leader>tt", function() require('neotest').run.run() end)
map("n", "<leader>tf", "<CMD>lua require('neotest').run.run(vim.fn.expand('%'))<CR>")


map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
