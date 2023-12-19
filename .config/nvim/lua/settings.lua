vim.o.guicursor = ""

vim.o.number = true
vim.o.relativenumber = true

vim.g.netrw_keepdir = 0
vim.g.netrw_banner = 0
vim.o.statusline = '%f'

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.scrolloff = 8

vim.o.updatetime = 50
vim.wo.signcolumn = 'yes'

vim.o.incsearch = true
vim.o.hlsearch = false

vim.o.syntax = 'on'
vim.o.errorbells = false
vim.o.smartcase = true
vim.o.showmode = false
vim.bo.swapfile = false
vim.o.backup = false

vim.o.hidden = true
vim.o.completeopt = 'menuone,noinsert,noselect'
vim.bo.autoindent = true
vim.bo.smartindent = true
vim.wo.wrap = false

vim.opt.shortmess = vim.opt.shortmess + { c = true }

vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

-- make zsh files recognized as sh for bash-ls & treesitter
vim.filetype.add {
	extension = {
		zsh = "sh",
		sh = "sh", -- force sh-files with zsh-shebang to still get sh as filetype
	},
	filename = {
		[".zshrc"] = "sh",
		[".zshenv"] = "sh",
	},
}
