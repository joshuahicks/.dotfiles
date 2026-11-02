return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",

	config = function()
		local treesitter = require("nvim-treesitter")
		treesitter.setup({})
		treesitter.install({
			"c",
			"css",
			"html",
			"javascript",
			"json",
			"lua",
			"markdown",
			"markdown_inline",
			"query",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
			"vue",
		})

		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("joshua-treesitter", { clear = true }),
			callback = function(event)
				local lang = vim.treesitter.language.get_lang(event.match)
				if not lang or not require("nvim-treesitter.parsers")[lang] then
					return
				end

				-- Install missing parsers before enabling highlighting and indentation.
				treesitter.install({ lang }):await(function(err, installed)
					if err or not installed then
						return
					end
					vim.schedule(function()
						if
							not vim.api.nvim_buf_is_valid(event.buf)
							or vim.treesitter.language.get_lang(vim.bo[event.buf].filetype) ~= lang
						then
							return
						end
						vim.treesitter.start(event.buf, lang)
						if vim.treesitter.query.get(lang, "indents") then
							vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
						end
						if event.match == "markdown" then
							vim.bo[event.buf].syntax = "markdown"
						end
					end)
				end)
			end,
		})
	end,
}
