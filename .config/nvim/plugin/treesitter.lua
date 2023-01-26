local configs = require'nvim-treesitter.configs'

configs.setup {
    ensure_installed = {"lua", "rust", "toml" },
    auto_install = true,
    highlight = {
        enable = true,
    }
}
