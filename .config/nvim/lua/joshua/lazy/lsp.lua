return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        -- LSP Support
        "neovim/nvim-lspconfig",
        -- Autocompletion
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "L3MON4D3/LuaSnip",
    },

    config = function()
        local lsp_zero = require('lsp-zero')

        lsp_zero.on_attach(function(client, bufnr)
          lsp_zero.default_keymaps({buffer = bufnr})
        end)

        require('mason').setup({})
        require('mason-lspconfig').setup({
          ensure_installed = {},
          handlers = {
            lsp_zero.default_setup,
          },
        })

        local cmp = require('cmp')
        local cmp_format = require('lsp-zero').cmp_format()

        cmp.setup({
          formatting = cmp_format,
        })
    end
}
