return require('packer').startup(function(use)
    -- package manager
    use 'wbthomason/packer.nvim'

    -- colour scheme
    use 'sainnhe/gruvbox-material'

    -- fuzzy file finding
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- syntax highlighting
    use('nvim-treesitter/nvim-treesitter', {
        run = ':TSUpdate'
    })

    -- rest client
    use {
        "rest-nvim/rest.nvim",
        commit = "8b62563",
        requires = { "nvim-lua/plenary.nvim" }
    }

    -- git
    use('lewis6991/gitsigns.nvim')

    -- Quality of life
    use('cohama/lexima.vim')
    use('norcalli/nvim-colorizer.lua')
    use('numToStr/Comment.nvim')
    -- use('dstein64/vim-startuptime')

    -- LSP stuff
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            -- Package manager
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    }
end)
