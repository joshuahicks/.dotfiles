return require('packer').startup(function(use)
    -- package manager
    use 'wbthomason/packer.nvim'

    -- colour scheme
    -- use 'ellisonleao/gruvbox.nvim'
    use 'tssm/fairyfloss.vim'

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
    use('lewis6991/gitsigns.nvim')
    use('cohama/lexima.vim')
    use('norcalli/nvim-colorizer.lua')
    -- use('dstein64/vim-startuptime')
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- LSP stuff
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            {
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer' },
            { 'L3MON4D3/LuaSnip' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }
end)
