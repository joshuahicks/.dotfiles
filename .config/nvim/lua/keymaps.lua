local options = { noremap = true, silent = true }

local map = function(mode, key, result)
    vim.api.nvim_set_keymap(
        mode,
        key,
        result,
        options
    )
end

-- map('i', ';;', '<C-o>A;', options)

-- Debugging (mfussenegger/nvim-dap)
map('n', '<F5>', "<Cmd>lua require'dap'.continue()<CR>", options)
map('n', '<F10>', "<Cmd>lua require'dap'.step_over()<CR>", options)
map('n', '<F11>', "<Cmd>lua require'dap'.step_into()<CR>", options)
map('n', '<F12>', "<Cmd>lua require'dap'.step_out()<CR>", options)
map('n', '<Leader>b', "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", options)
map('n', '<Leader>B', "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", options)
map('n', '<Leader>lp', "<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", options)
map('n', '<Leader>dr', "<Cmd>lua require'dap'.repl.open()<CR>", options)
map('n', '<Leader>dl', "<Cmd>lua require'dap'.run_last()<CR>", options)

-- Floaterm
map('n', '<leader>ft', ':FloatermNew --name=myfloat --height=0.8 --width=0.7 --autoclose=2 fish <CR>', options)
map('n', 't', ':FloatermToggle myfloat<CR>', options)
map('t', '<Esc>', '<C-\\><C-n>:q<CR>', options)

-- Trouble
map('n', '<leader>xx', '<cmd>TroubleToggle<cr>', options)
map('n', '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>', options)
map('n', '<leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>', options)
map('n', '<leader>xl', '<cmd>TroubleToggle loclist<cr>', options)
map('n', '<leader>xq', '<cmd>TroubleToggle quickfix<cr>', options)
map('n', 'gR', '<cmd>TroubleToggle lsp_references<cr>', options)
