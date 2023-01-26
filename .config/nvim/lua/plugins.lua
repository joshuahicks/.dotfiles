return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    -- Plenary
    use 'nvim-lua/plenary.nvim'

    -- LSP stuff
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Debugger
    use 'mfussenegger/nvim-dap'

    -- Color Scheme
    use 'gruvbox-community/gruvbox'

    -- Utility stuff
    use 'nvim-tree/nvim-web-devicons'
    use 'jiangmiao/auto-pairs'
    use 'tanvirtin/vgit.nvim'
    use 'nvim-lualine/lualine.nvim'
    use 'voldikss/vim-floaterm'
    use 'folke/todo-comments.nvim'
    use 'folke/trouble.nvim'
    use 'nvim-tree/nvim-tree.lua'

    -- Rust
    use 'simrat39/rust-tools.nvim'

    -- Completion framework
    -- TODO: learn about these more
    use 'hrsh7th/nvim-cmp' 
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-vsnip'                             
    use 'hrsh7th/cmp-path'                              
    use 'hrsh7th/cmp-buffer'                            
    use 'hrsh7th/vim-vsnip'
end)
