local options = { noremap = true, silent = true }

local map = function(mode, key, results)
	vim.api.nvim_set_keymap(mode, key, results, options)
end

function WinMove(key)
	local curwin = vim.api.nvim_get_current_win()
	vim.cmd("wincmd " .. key)
	if curwin == vim.api.nvim_get_current_win() then
		if string.match(key, "[jk]") then
			vim.cmd("wincmd s")
		else
			vim.cmd("wincmd v")
		end
		vim.cmd("wincmd " .. key)
	end

	-- Check if the current directory is a Git repository
	local is_git_repo = vim.fn.system("git rev-parse --is-inside-work-tree >/dev/null 2>&1")
	if is_git_repo == 0 then
		-- Find the project root directory using git
		local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")
		if #git_root > 0 then
			-- Set the working directory to the project root
			vim.cmd("lcd " .. git_root[1])
		end
	end
end

-- netrw
map("n", "<leader>pv", "<Cmd>Ex<CR>")
map("n", "<leader><leader><leader><leader><leader><leader>l", "<Plug>NetrwRefresh")

-- pane navigation
map("n", "<C-h>", ':lua WinMove("h")<CR>')
map("n", "<C-j>", ':lua WinMove("j")<CR>')
map("n", "<C-k>", ':lua WinMove("k")<CR>')
map("n", "<C-l>", ':lua WinMove("l")<CR>')

-- tabs
map("n", "<C-t>", "<Cmd>tabe<CR>")
-- map("n", "<C-n>", "<Cmd>tabn<CR>")
map("n", "<C-x>", "<Cmd>tabc<CR>")
map("n", "<C-]>", "<C-w><C-]><C-w>T")
for i = 1, 9 do
	map("n", "<leader>" .. i, "<Cmd>tabnext " .. i .. "<CR>")
end

-- lsp diagnostic enable/disable
map("n", "<leader>dh", ":lua vim.diagnostic.disable()<CR>")
map("n", "<leader>ds", ":lua vim.diagnostic.enable()<CR>")

-- code actions
map("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>")

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("x", "<leader>p", [["_dP]])

map("n", "<leader>y", [["+y]])
map("v", "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

map("n", "<leader>d", [["_d]])
map("v", "<leader>d", [["_d]])

map("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- reference list navigation
map("n", "<C-n>", "<cmd>cnext<CR>zz")
map("n", "<C-b>", "<cmd>cprev<CR>zz")
-- map("n", "<leader>k", "<cmd>lnext<CR>zz")
-- map("n", "<leader>j", "<cmd>lprev<CR>zz")

-- nvim rest
map("n", "<leader>r", "<Plug>RestNvim")

-- python execution
function ExecuteCurrentPythonFile()
	local file_name = vim.fn.expand("%:p")
	local command = "!python3 " .. file_name
	vim.api.nvim_command(command)
end
map("n", "<leader>ef", ":lua ExecuteCurrentPythonFile()<CR>")

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
