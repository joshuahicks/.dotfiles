return require('packer').startup(function(use)
    -- package manager
    use 'wbthomason/packer.nvim'

    -- colour scheme
    use 'ellisonleao/gruvbox.nvim'

    -- file fuzzy finding
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- syntax highlighting
    use('nvim-treesitter/nvim-treesitter', {
        run = ':TSUpdate'
    })

    -- rest client
    use {
        "rest-nvim/rest.nvim",
        requires = { "nvim-lua/plenary.nvim" }
    }

    -- Quality of life
    use('nvim-tree/nvim-web-devicons')
    use('nvim-lualine/lualine.nvim')
    use('lewis6991/gitsigns.nvim')
    use('cohama/lexima.vim')
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- LSP stuff
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },         -- Required
            { 'hrsh7th/cmp-nvim-lsp' },     -- Required
            { 'hrsh7th/cmp-buffer' },       -- Optional
            { 'hrsh7th/cmp-path' },         -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' },     -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' },             -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    }
end)
