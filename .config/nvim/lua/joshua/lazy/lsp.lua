return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",

		{ "j-hui/fidget.nvim", opts = {} },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
				map("gr", vim.lsp.buf.references, "[G]oto [R]eferences")
				map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
				map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
				map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
				map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
				map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
				map("K", vim.lsp.buf.hover, "Hover Documentation")
				map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
			end,
		})
		require("mason").setup()

		local capabilities = vim.lsp.protocol.make_client_capabilities()

		local vue_language_server_path = vim.fn.stdpath("data")
			.. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

		local servers = {
			lua_ls = {
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						workspace = {
							checkThirdParty = false,
							library = {
								"${3rd}/luv/library",
								unpack(vim.api.nvim_get_runtime_file("", true)),
							},
						},
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			},
		}

		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			"stylua", -- Used to format lua code
			"vue-language-server", -- Vue language server for vue_ls
		})
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		require("mason-lspconfig").setup({
			ensure_installed = { "ts_ls", "vue_ls" },
			handlers = {
				-- Default handler for servers
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
				-- Custom handler for ts_ls to add Vue support
				ts_ls = function()
					require("lspconfig").ts_ls.setup({
						capabilities = capabilities,
						init_options = {
							plugins = {
								{
									name = "@vue/typescript-plugin",
									location = vue_language_server_path,
									languages = { "vue" },
								},
							},
						},
						filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
					})
				end,
				-- Custom handler for vue_ls
				vue_ls = function()
					require("lspconfig").vue_ls.setup({
						capabilities = capabilities,
						on_init = function(client)
							client.handlers["tsserver/request"] = function(_, result, context)
								local ts_clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = "ts_ls" })
								local vtsls_clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = "vtsls" })
								local clients = {}

								vim.list_extend(clients, ts_clients)
								vim.list_extend(clients, vtsls_clients)

								if #clients == 0 then
									vim.notify(
										"Could not find `vtsls` or `ts_ls` lsp client, `vue_ls` would not work without it.",
										vim.log.levels.ERROR
									)
									return
								end
								local ts_client = clients[1]

								local param = unpack(result)
								local id, command, payload = unpack(param)
								ts_client:exec_cmd({
									title = "vue_request_forward",
									command = "typescript.tsserverRequest",
									arguments = {
										command,
										payload,
									},
								}, { bufnr = context.bufnr }, function(_, r)
									local response = r and r.body
									local response_data = { { id, response } }

									---@diagnostic disable-next-line: param-type-mismatch
									client:notify("tsserver/response", response_data)
								end)
							end
						end,
					})
				end,
			},
		})
	end,
}
