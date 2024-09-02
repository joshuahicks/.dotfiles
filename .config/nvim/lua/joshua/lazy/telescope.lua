return {
	"nvim-telescope/telescope.nvim",

	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	config = function()
		require("telescope").setup({
			pickers = {
				find_files = {
					hidden = true,
				},
			},
		})

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
		vim.keymap.set("n", "<C-p>", builtin.git_files, {})
		vim.keymap.set("n", "<leader>pb", builtin.buffers, {})
		vim.keymap.set("n", "<leader>ps", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end)
		-- nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
		vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
	end,
}
