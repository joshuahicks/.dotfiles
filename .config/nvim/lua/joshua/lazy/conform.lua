return {
	"stevearc/conform.nvim",
	opts = {
		notify_on_error = true,
		default_format_opts = {
			timeout_ms = 1000,
			lsp_format = "fallback",
		},
		format_on_save = function(bufnr)
			local filetype = vim.bo[bufnr].filetype
			if filetype == "lua" or filetype == "go" then
				return {}
			end
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "gofumpt", "golines" },
		},
	},
}
